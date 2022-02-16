# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake

EGIT_REPO_URI="https://github.com/surge-synthesizer/surge.git"


DESCRIPTION="Open source synthesizer plug-in"
HOMEPAGE="https://surge-synthesizer.github.io/"
KEYWORDS="~amd64"
LICENSE="GPL-3"
SLOT="0"
IUSE="+vst3 headless"

DEPEND="
	x11-libs/cairo
	x11-libs/libxcb
	x11-libs/libxkbcommon[X]
	x11-libs/xcb-util-cursor
	x11-libs/xcb-util-keysyms
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	use vst3 && cmake_build
	use headless && cmake_build surge-headless
}

src_install() {
	dodir /usr/share
	cp -r "${S}/resources/data" "${D}/usr/share/surge" || die "Failed to install"
	if use vst3; then
		dodir /usr/$(get_libdir)/vst3
		cp -r "${BUILD_DIR}/surge_products/Surge.vst3" "${D}/usr/$(get_libdir)/vst3" || die "Failed to install"
	fi
	if use headless; then
		dodir /usr/bin
		dobin "${BUILD_DIR}/surge-headless"
	fi
}
