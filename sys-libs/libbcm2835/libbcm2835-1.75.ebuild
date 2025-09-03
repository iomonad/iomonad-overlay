# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="C library for Broadcom BCM 2835 as used in Raspberry Pi"

HOMEPAGE="https://www.airspayce.com/mikem/bcm2835/"
SRC_URI="http://www.airspayce.com/mikem/bcm2835/bcm2835-${PV}.tar.gz"
LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="arm"
IUSE=""
RDEPEND=">=sys-devel/gcc-11.2.0:11="
DEPEND="${RDEPEND}"
