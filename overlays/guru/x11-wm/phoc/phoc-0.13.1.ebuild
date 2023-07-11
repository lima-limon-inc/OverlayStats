# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson xdg gnome2-utils

MY_PV="v${PV}"
MY_P="${PN}-${MY_PV}"

WL_COMMIT="c9cd3502ba6113070020de50e41f0af72e0f5031"
WL_P="wlroots-${WL_COMMIT}"

DESCRIPTION="Wlroots based Phone compositor"
HOMEPAGE="https://gitlab.gnome.org/World/Phosh/phoc"

SRC_URI="
	https://gitlab.gnome.org/World/Phosh/phoc/-/archive/${MY_PV}/${MY_P}.tar.gz
	https://source.puri.sm/Librem5/wlroots/-/archive/${WL_COMMIT}/${WL_P}.tar.gz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="+introspection +systemd test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-libs/glib
	dev-libs/gobject-introspection
	dev-libs/libinput
	dev-libs/wayland
	dev-libs/wayland-protocols
	gnome-base/gnome-desktop
	systemd? (
		!sys-apps/openrc
		sys-apps/systemd
	)
	x11-libs/libdrm
	x11-libs/pixman
	x11-libs/xcb-util
	x11-libs/xcb-util-wm
	x11-wm/mutter
	sys-auth/seatd
	!gui-libs/wlroots
"

BDEPEND="
	dev-util/ctags
	dev-util/meson
	virtual/pkgconfig
	x11-base/xorg-server
"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	default
	rm -r "${S}"/subprojects/wlroots || die "Failed to remove bundled wlroots"
	cp -r "${WORKDIR}/${WL_P}" "${S}"/subprojects/wlroots || die "Failed to copy right version of wlroots"
}

src_configure() {
	local emesonargs=(
		-Ddefault_library=shared
		-Dtests=false
	)
	meson_src_configure
}

src_install() {
	DESTDIR="${D}" meson_src_install
	dobin "${S}"/helpers/scale-to-fit
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
}
