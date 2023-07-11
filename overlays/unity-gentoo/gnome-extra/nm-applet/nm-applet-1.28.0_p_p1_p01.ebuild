# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
GNOME2_LA_PUNT="yes"
GNOME_ORG_MODULE="network-manager-applet"

URELEASE="kinetic"
inherit autotools eutils gnome2 meson ubuntu-versionator

MY_P="${GNOME_ORG_MODULE}_${PV}"
S="${WORKDIR}/${GNOME_ORG_MODULE}-${PV}"

DESCRIPTION="GNOME applet for NetworkManager"
HOMEPAGE="https://wiki.gnome.org/Projects/NetworkManager"
SRC_URI="${UURL}/${MY_P}.orig.tar.xz
	${UURL}/${MY_P}-${UVER}.debian.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
IUSE="+modemmanager selinux systemd teamd"
#KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"

RDEPEND=">=app-crypt/libsecret-0.18
	>=dev-libs/glib-2.38:2[dbus]
	>=dev-libs/dbus-glib-0.88
	dev-libs/libappindicator:3
	>=dev-libs/libdbusmenu-16.04.0
	>=dev-libs/libgudev-147:=
	>=net-libs/libnma-1.8.27
	>=sys-apps/dbus-1.6.12[systemd?]
	>=sys-auth/polkit-0.96-r1
	>=x11-libs/gtk+-3.10:3
	>=x11-libs/libnotify-0.7.0

	app-text/iso-codes
	>=net-misc/networkmanager-1.7:=[modemmanager?,teamd?]
	net-misc/mobile-broadband-provider-info

	virtual/freedesktop-icon-theme
	modemmanager? ( net-misc/modemmanager )
	selinux? ( sys-libs/libselinux )
	teamd? ( >=dev-libs/jansson-2.7 )"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-libs/libxml2
	>=sys-devel/gettext-0.19.8
	virtual/pkgconfig"
PDEPEND="virtual/notification-daemon" #546134

src_prepare() {
	ubuntu-versionator_src_prepare
	sed -e "s:-Werror::g" \
                -i "configure" || die
	eautoreconf
	gnome2_src_prepare
}

src_configure() {
	local emesonargs=(
		$(meson_use modemmanager wwan)
		$(meson_use selinux)
		$(meson_use teamd team)
		-Dappindicator=ubuntu
		-Dmore_asserts=0
		-Dld_gc=false
	)
	meson_src_configure
}

src_install() {
	meson_src_install

	dosym nm-signal-00.png \
		/usr/share/icons/hicolor/22x22/apps/gsm-3g-none.png
	dosym nm-signal-00-secure.png \
		/usr/share/icons/hicolor/22x22/apps/gsm-3g-none-secure.png
	dosym nm-signal-25.png \
		/usr/share/icons/hicolor/22x22/apps/gsm-3g-low.png
	dosym nm-signal-25-secure.png \
		/usr/share/icons/hicolor/22x22/apps/gsm-3g-low-secure.png
	dosym nm-signal-50.png \
		/usr/share/icons/hicolor/22x22/apps/gsm-3g-medium.png
	dosym nm-signal-50-secure.png \
		/usr/share/icons/hicolor/22x22/apps/gsm-3g-medium-secure.png
	dosym nm-signal-75.png \
		/usr/share/icons/hicolor/22x22/apps/gsm-3g-high.png
	dosym nm-signal-75-secure.png \
		/usr/share/icons/hicolor/22x22/apps/gsm-3g-high-secure.png
	dosym nm-signal-100.png \
		/usr/share/icons/hicolor/22x22/apps/gsm-3g-full.png
	dosym nm-signal-100-secure.png \
		/usr/share/icons/hicolor/22x22/apps/gsm-3g-full-secure.png
}

pkg_preinst() {
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_schemas_update
}

pkg_postrm() {
	gnome2_schemas_update
}
