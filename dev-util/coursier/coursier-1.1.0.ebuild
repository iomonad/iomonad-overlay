# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Pure Scala Artifact Fetching (Binary)"
HOMEPAGE="https://github.com/coursier/coursier"
SRC_URI="https://github.com/coursier/coursier/archive/v${PV}-M1.zip -> coursier-${PV}-M1.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="
	>=virtual/jdk-1.5
	"

S=${WORKDIR}

QA_PREBUILT="/usr/bin/coursier"

src_prepare() {
	default

	mv coursier-${PV}-M1/coursier coursier || die
	fperms +x coursier || die
}

src_install() {
	dobin coursier
}
