# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="A highly scalable second-generation distributed database"
HOMEPAGE="https://cassandra.apache.org/"
SRC_URI="mirror://apache/cassandra/${PV}/apache-cassandra-${PV}-bin.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="
	>=virtual/jdk-1.5
	"

S="${WORKDIR}/apache-cassandra-${PV}"
INSTALL_DIR="/opt/cassandra-${PV}"

pkg_setup() {
	enewgroup cassandra
	enewuser cassandra -1 /bin/bash ${INSTALL_DIR} cassandra
}

src_prepare() {
	find . \( -name \*.bat -or -name \*.exe \) -delete
	rm bin/stop-server
}

src_install() {
	insinto ${INSTALL_DIR}

	sed -e "s|/var/lib/cassandra|/var/lib/cassandra/${SLOT}|g" \
		-i conf/cassandra.yaml || die

	sed -e "s|cassandra_storagedir=\"\$CASSANDRA_HOME/data\"|cassandra_storagedir=\"/var/lib/cassandra/${SLOT}\"|g" \
		-i bin/cassandra.in.sh || die

	doins -r bin conf interface lib pylib tools

	for i in bin/* ; do
		if [[ $i == *.in.sh ]]; then
			continue
		fi
		fperms 755 ${INSTALL_DIR}/${i}
		make_wrapper "$(basename ${i})-${SLOT}" "${INSTALL_DIR}/${i}"
	done

	keepdir /var/lib/cassandra/${SLOT}
	fowners -R cassandra:cassandra ${INSTALL_DIR}
	fowners -R cassandra:cassandra /var/lib/cassandra

	if use systemd; then
		sed -e "s/{SLOT}/${SLOT}/g" -e "s/{PV}/${PV}/g" "${FILESDIR}/cassandra.service" > "${T}/cassandra-${SLOT}.service" || die
		systemd_dounit "${T}/cassandra-${SLOT}.service"
	else
		sed -e "s/{SLOT}/${SLOT}/g" -e "s/{PV}/${PV}/g" "${FILESDIR}/init" > "${T}/init" || die
		newinitd "${T}/init" cassandra-${SLOT}
	fi

	echo "CONFIG_PROTECT=\"${INSTALL_DIR}/conf\"" > "${T}/25cassandra-${SLOT}" || die
	doenvd "${T}/25cassandra-${SLOT}"
}
