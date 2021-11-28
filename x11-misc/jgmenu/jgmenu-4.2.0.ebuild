# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A simple, independent and contemporary-looking X11 menu"
HOMEPAGE="https://github.com/johanmalm/jgmenu"

SRC_URI="https://github.com/johanmalm/jgmenu/archive/v${PV}/jgmenu-${PV}.tar.gz"
LICENSE="LGPL-2.1+"

SLOT="0"

KEYWORDS="amd64 x86"

IUSE=""
RDEPEND=">=x11-base/xorg-x11-7.4-r3:0="
