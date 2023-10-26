# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Simple, fast HTTP 1.1 web server for static content."
HOMEPAGE="https://unix4lyfe.org/darkhttpd/"
SRC_URI="https://github.com/emikulic/darkhttpd/archive/refs/tags/v${PV}.tar.gz -> darkhttpd-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm x86"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin ${PN}
}
