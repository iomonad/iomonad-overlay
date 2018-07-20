# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="Simple, fast HTTP 1.1 web server for static content."
HOMEPAGE="https://unix4lyfe.org/darkhttpd/"
SRC_URI="https://unix4lyfe.org/darkhttpd/darkhttpd-${PV}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
    dobin ${PN}
}
