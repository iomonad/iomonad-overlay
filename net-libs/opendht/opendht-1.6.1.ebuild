# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )

inherit cmake-utils python-r1 versionator git-r3 eutils

DESCRIPTION="A lightweight C++11 Distributed Hash Table implementation"
HOMEPAGE="https://github.com/savoirfairelinux/opendht/blob/master/README.md"
EGIT_REPO_URI="git://github.com/savoirfairelinux/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
IUSE="python static-libs"

DEPEND=">=dev-libs/msgpack-2.0
	>=net-libs/gnutls-3.3
	python? ( dev-python/cython[$(python_gen_usedep python3_{4,5,6})] )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DOPENDHT_PYTHON=$(usex python)
		-DOPENDHT_STATIC=$(usex static-libs)
	)
	cmake-utils_src_configure
}

src_install() {
	rm README.md
	cmake-utils_src_install
}
