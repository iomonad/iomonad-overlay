# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="X11 keyboard indicator and switcher"
HOMEPAGE="https://github.com/zen-tools/gxkb"
SRC_URI="https://github.com/zen-tools/gxkb/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-libs/glib:2
	x11-libs/gtk+:3
	x11-libs/libwnck:3
	x11-libs/gdk-pixbuf:2
	x11-libs/libxklavier
"
DEPEND="
	virtual/pkgconfig
	${RDEPEND}
"

src_prepare() {
	eautoreconf
	eapply_user
}
