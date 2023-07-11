# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit savedconfig

DESCRIPTION="Modular status bar for dwm written in c."

HOMEPAGE="https://github.com/torrinfail/dwmblocks"
SRC_URI="https://github.com/toniz4/dwmblocks/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"
IUSE="statuscmd"

RDEPEND="
	x11-libs/libX11
"

DEPEND="${RDEPEND}
	virtual/pkgconfig
"

src_prepare() {
	default

	if use statuscmd; then
		eapply -p1 "${FILESDIR}/${PN}-statuscmd-${PV}.patch"
	fi

	restore_config blocks.h
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install

	save_config blocks.h
}

pkg_postinst() {
	if use statuscmd; then
		elog "The statuscmd needs the statuscmd-signal dwm patch to work."
		elog "Not using this patch with the statuscmd use flag enabled"
		elog "could result in the bar closing when clicked."
		elog "link of the dwm patch: https://dwm.suckless.org/patches/statuscmd/"
	fi
}
