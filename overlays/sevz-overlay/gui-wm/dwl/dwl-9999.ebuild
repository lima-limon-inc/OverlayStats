# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit savedconfig git-r3

DESCRIPTION="patched version of dwl"
HOMEPAGE="https://github.com/Sevz17/dwl"
EGIT_REPO_URI="https://github.com/Sevz17/dwl"

LICENSE="CC0-1.0 GPL-3 MIT"
SLOT="0"
KEYWORDS=""
IUSE="X"

RDEPEND="
	dev-libs/libinput
	dev-libs/wayland
	x11-libs/libxcb
	x11-libs/libxkbcommon
	>=gui-libs/wlroots-0.15:=[X(-)?]
	<gui-libs/wlroots-0.16:=[X(-)?]
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-libs/wayland-protocols
	dev-util/wayland-scanner
	virtual/pkgconfig
"

src_prepare() {
	restore_config config.def.h

	default
}

src_configure() {
	sed -i "s/^.*CFLAGS += -DXWAYLAND/$(usex X 'CFLAGS += -DXWAYLAND' '')/g" config.mk || die
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install

	einstalldocs

	save_config config.def.h
}
