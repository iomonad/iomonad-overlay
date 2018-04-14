# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Pure Scala Artifact Fetching (Binary)"
HOMEPAGE="https://github.com/coursier/coursier"
SRC_URI="https://github.com/coursier/coursier/archive/master.zip -> coursier-master.zip"

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

	mv coursier-master/coursier coursier || die
	fperms +x coursier
}

src_install() {
	dobin coursier
}
