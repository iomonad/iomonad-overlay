# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A simple, independent and contemporary-looking X11 menu"
HOMEPAGE="https://github.com/johanmalm/jgmenu"

SRC_URI="https://github.com/johanmalm/jgmenu/archive/v${PV}/jgmenu-${PV}.tar.gz"
LICENSE="LGPL-2.1+"

SLOT="0"

KEYWORDS="amd64 x86"

IUSE=""
RDEPEND=">=x11-base/xorg-server-21.1.8-r2:0="
