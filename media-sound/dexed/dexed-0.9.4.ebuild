# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="DX7 FM multi plaform/multi format plugin"
HOMEPAGE="https://github.com/asb2m10/dexed"
SRC_URI="https://github.com/asb2m10/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RESTRICT="mirror"

DEPEND="
	media-libs/alsa-lib
	net-misc/curl:=[curl_ssl_openssl]
	>=media-libs/freeglut-3.0.0
	media-libs/freetype
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXinerama
	x11-libs/libXrandr
	media-libs/mesa
"
RDEPEND="${DEPEND}"

S="${S}/Builds/Linux"

src_install() {
	dolib.so build/Dexed.so
	dobin build/Dexed
}
