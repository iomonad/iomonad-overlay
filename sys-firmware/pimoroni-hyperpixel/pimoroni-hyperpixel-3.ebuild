# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Driver for the Pimoroni HyperPixel 4.0 Touchscreen Display"

HOMEPAGE="https://github.com/pimoroni/hyperpixel4"
SRC_URI="https://github.com/pimoroni/hyperpixel4/archive/refs/heads/pi${PV}.zip"
LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="arm"
IUSE=""
RDEPEND=""
DEPEND=">=sys-apps/dtc-1.6.0"

src_compile() {
	if [[ -f Makefile ]] || [[ -f GNUmakefile ]] || [[ -f makefile ]]; then
		emake || die "emake failed"
	fi
}

src_install() {
	if [[ -f Makefile ]] || [[ -f GNUmakefile ]] || [[ -f makefile ]] ; then
		emake DESTDIR="${D}" install
	fi

	if ! declare -p DOCS >/dev/null 2>&1 ; then
		local d
		for d in README* ChangeLog AUTHORS NEWS TODO CHANGES THANKS BUGS \
				FAQ CREDITS CHANGELOG ; do
			[[ -s "${d}" ]] && dodoc "${d}"
		done
	elif [[ $(declare -p DOCS) == "declare -a"* ]] ; then
		dodoc "${DOCS[@]}"
	else
		dodoc ${DOCS}
	fi
}
