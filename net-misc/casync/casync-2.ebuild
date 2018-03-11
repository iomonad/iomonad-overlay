# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit meson

DESCRIPTION="Content Addressable Data Synchronizer"
HOMEPAGE="https://github.com/systemd/casync"

SRC_URI="https://github.com/systemd/casync/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+fuse"

DEPEND="
		>=app-arch/xz-utils-5.1.0
		app-arch/zstd
		>=dev-libs/openssl-1.0:0=
		>=net-misc/curl-7.32.0
		sys-apps/acl
		dev-python/sphinx
		fuse? ( >=sys-fs/fuse-2.6:0= )
		sys-libs/zlib
"

RDEPEND="${DEPEND}"

src_prepare() {
	default_src_prepare
}

src_configure() {
	local emesonargs=(
		-Dfuse=$(usex fuse true false)
	)
	meson_src_configure
}
