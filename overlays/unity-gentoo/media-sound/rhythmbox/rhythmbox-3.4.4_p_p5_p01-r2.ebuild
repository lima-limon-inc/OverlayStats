# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{8..10} )
PYTHON_REQ_USE="xml"

URELEASE="jammy"
inherit autotools eutils gnome2-utils python-single-r1 multilib ubuntu-versionator virtualx

DESCRIPTION="Music management and playback software for GNOME patched for the Unity desktop"
HOMEPAGE="https://wiki.gnome.org/Apps/Rhythmbox"
SRC_URI="${UURL}/${MY_P}.orig.tar.xz
	${UURL}/${MY_P}-${UVER}.debian.tar.xz"

LICENSE="GPL-2"
SLOT="0"
IUSE="cdr daap dbus ipod libnotify libsecret lirc mtp nsplugin +python test +udev upnp-av visualizer zeitgeist"
KEYWORDS="~amd64 ~x86"
REQUIRED_USE="
	ipod? ( udev )
	mtp? ( udev )
	dbus? ( python )
	python? ( ^^ ( $(python_gen_useflags '*') ) )"

# Tests failing for years without upstream caring at all
# upstream bug #688745
RESTRICT="mirror test"

COMMON_DEPEND="
	>=dev-libs/glib-2.34:2
	>=dev-libs/libxml2-2.7.8:2
	>=x11-libs/gtk+-3.6:3[X,introspection]
	>=x11-libs/gdk-pixbuf-2.18:2
	>=dev-libs/gobject-introspection-0.10
	>=dev-libs/libpeas-0.7.3[gtk,python?]
	>=dev-libs/totem-pl-parser-3.2
	>=net-libs/libsoup-2.34:2.4
	media-libs/gst-plugins-base:1.0[introspection]
	media-libs/gstreamer:1.0[introspection]
	>=sys-libs/tdb-1.2.6
	dev-libs/json-glib

	visualizer? (
		media-libs/clutter
		media-libs/clutter-gst
		media-libs/clutter-gtk
		media-plugins/gst-plugins-libvisual:1.0 )
	cdr? ( >=app-cdr/brasero-2.91.90 )
	daap? (
		>=net-libs/libdmapsharing-2.9.19:3.0
		media-plugins/gst-plugins-soup:1.0 )
	libsecret? ( >=app-crypt/libsecret-0.18 )
	libnotify? ( >=x11-libs/libnotify-0.7.0 )
	lirc? ( app-misc/lirc )
	python? (
		$(python_gen_cond_dep '
			>=dev-python/pygobject-3.0:3[${PYTHON_USEDEP}]
		') )
	udev? (
		dev-libs/libgudev:=
		ipod? ( >=media-libs/libgpod-0.7.92[udev] )
		mtp? ( >=media-libs/libmtp-0.3 ) )
	zeitgeist? ( gnome-extra/zeitgeist )"
RDEPEND="${COMMON_DEPEND}
	media-plugins/gst-plugins-soup:1.0
	media-plugins/gst-plugins-libmms:1.0
	|| (
		media-plugins/gst-plugins-cdparanoia:1.0
		media-plugins/gst-plugins-cdio:1.0 )
	media-plugins/gst-plugins-meta:1.0
	media-plugins/gst-plugins-taglib:1.0
	x11-themes/gnome-icon-theme-symbolic
	upnp-av? (
		>=media-libs/grilo-0.2:0.2
		>=media-plugins/grilo-plugins-0.2:0.2[upnp-av] )
	python? (
		>=dev-libs/libpeas-0.7.3[${PYTHON_SINGLE_USEDEP}]
		x11-libs/gdk-pixbuf:2[introspection]
		x11-libs/gtk+:3[introspection]
		x11-libs/pango[introspection]

		dbus? ( sys-apps/dbus )
		libsecret? ( >=app-crypt/libsecret-0.18[introspection] ) )"
DEPEND="${COMMON_DEPEND}
	virtual/pkgconfig
	app-text/yelp-tools
	dev-util/gtk-doc-am
	>=dev-util/intltool-0.35
	>=app-text/gnome-doc-utils-0.9.1
	test? ( dev-libs/check )"

pkg_setup() {
	ubuntu-versionator_pkg_setup
	use python && python-single-r1_pkg_setup
}

src_prepare() {
	ubuntu-versionator_src_prepare
	eautoreconf
	DOCS="AUTHORS ChangeLog DOCUMENTERS INTERNALS \
		MAINTAINERS MAINTAINERS.old NEWS README THANKS"

#	rm -v lib/rb-marshal.{c,h} || die # upstream bug 737831
}

src_configure() {
	# FIXME: bug???
	export GST_INSPECT=/bin/true

	# --enable-vala just installs the sample vala plugin, and the configure
	# checks are broken, so don't enable it
	econf \
		MOZILLA_PLUGINDIR=/usr/$(get_libdir)/nsbrowser/plugins \
		VALAC=$(type -P true) \
		--enable-mmkeys \
		--disable-more-warnings \
		--disable-static \
		--disable-vala \
		--without-hal \
		$(use_enable visualizer) \
		$(use_enable daap) \
		$(use_enable libnotify) \
		$(use_enable lirc) \
		$(use_enable nsplugin browser-plugin) \
		$(use_enable python) \
		$(use_enable upnp-av grilo) \
		$(use_with cdr brasero) \
		$(use_with ipod) \
		$(use_with libsecret) \
		$(use_with mtp) \
		$(use_with udev gudev)
}

src_install() {
	emake DESTDIR="${ED}" install

	dodoc AUTHORS ChangeLog DOCUMENTERS INTERNALS \
		MAINTAINERS MAINTAINERS.old NEWS README THANKS

	# Remove unused libtool libarchive files #
	find "${ED}" -name '*.la' -delete || die
}

src_test() {
	unset SESSION_MANAGER
	unset DBUS_SESSION_BUS_ADDRESS
	Xemake check
}

pkg_preinst() {
	gnome2_schemas_savelist
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_schemas_update
	gnome2_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	gnome2_schemas_update
	gnome2_icon_cache_update
}
