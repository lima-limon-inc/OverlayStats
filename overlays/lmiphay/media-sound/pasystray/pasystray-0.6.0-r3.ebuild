# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome2-utils autotools vcs-snapshot xdg

DESCRIPTION="PulseAudio system tray"
HOMEPAGE="https://github.com/christophgysin/pasystray"
SRC_URI="https://github.com/christophgysin/${PN}/archive/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="libnotify plasma"

RDEPEND="
	>=media-sound/pulseaudio-5.0-r3[glib,zeroconf]
	>=net-dns/avahi-0.6
	>=dev-libs/glib-2.48.2
	x11-libs/gtk+:3
	x11-libs/libX11
	libnotify? ( >=x11-libs/libnotify-0.7 )
	plasma? ( dev-libs/libappindicator:3 )
"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	default
	eautoreconf
}
src_configure() {
	econf $(use_enable libnotify notify)
}

src_install() {
	emake DESTDIR="${D}" install
	einstalldocs
	doman man/pasystray.1
}

pkg_preinst() {
		xdg_pkg_preinst
		gnome2_icon_savelist
}

pkg_postinst() {
		xdg_desktop_database_update
		xdg_mimeinfo_database_update
		gnome2_icon_cache_update
}
pkg_postrm() {
		xdg_desktop_database_update
		xdg_mimeinfo_database_update
		gnome2_icon_cache_update
}
