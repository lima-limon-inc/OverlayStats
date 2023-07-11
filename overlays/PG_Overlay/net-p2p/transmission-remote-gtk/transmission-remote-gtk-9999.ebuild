# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson git-r3

DESCRIPTION="GTK+ client for management of the Transmission BitTorrent client, over HTTP RPC"
HOMEPAGE="https://github.com/transmission-remote-gtk/transmission-remote-gtk"
EGIT_REPO_URI="https://github.com/${PN}/${PN}.git"
SRC_URI=""

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE="ayatana debug geoip libnotify libproxy rss"

# RESTRICT="test"

# FIXME: bundles rss-glib-0.2.3
RDEPEND="
	>=dev-libs/glib-2.44:2
	>=dev-libs/json-glib-0.12.6
	net-libs/libsoup:3.0
	>=x11-libs/gtk+-3.16:3
	ayatana? ( dev-libs/libappindicator:3 )
	geoip? ( dev-libs/geoip )
	libnotify? ( >=x11-libs/libnotify-0.7 )
	libproxy? ( net-libs/libproxy )
	rss? ( >=net-libs/libmrss-0.18 )
"
DEPEND="${RDEPEND}
	>=sys-devel/gettext-0.19.6
	virtual/pkgconfig
"

src_prepare() {
	default
}

src_configure() {
	# Disable overly strict appdata validation
	local emesonargs=(
		$(meson_native_use_feature geoip)
		$(meson_native_use_feature libproxy)
		$(meson_native_use_feature ayatana libappindicator)
		$(meson_native_use_feature rss libmrss)
	)

	meson_src_configure
}
