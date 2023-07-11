# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg rpm

DESCRIPTION="Cisco video conferencing and online meeting software"
HOMEPAGE="https://www.webex.com/"
SRC_URI="https://binaries.webex.com/WebexDesktop-CentOS-Official-Package/Webex.rpm -> ${P}.rpm"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE="wayland"

RESTRICT="bindist mirror strip"

DEPEND=""

RDEPEND="
	app-accessibility/at-spi2-atk
	app-crypt/libsecret
	dev-libs/atk
	dev-libs/nss
	wayland? ( dev-libs/wayland )
	media-libs/alsa-lib
	media-libs/libglvnd
	media-libs/mesa
	media-sound/pulseaudio
	sys-apps/lshw
	sys-power/upower
	virtual/libudev
	x11-libs/libXScrnSaver
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXrandr
	x11-libs/libnotify
	x11-libs/libxkbcommon
	x11-libs/pango
	x11-libs/xcb-util-image
	x11-libs/xcb-util-keysyms
	x11-libs/xcb-util-renderutil
	x11-libs/xcb-util-wm
"

S=${WORKDIR}

QA_PREBUILT="*"

src_install() {
	mv opt "${D}/" || die

	sed -e 's:Utility;Application;:Network;InstantMessaging;:g' \
		-i "${D}/opt/Webex/bin/webex.desktop" || die
	sed -e '/^Version=.*$/d' -i "${D}/opt/Webex/bin/webex.desktop" || die

	domenu "${D}/opt/Webex/bin/webex.desktop"
	doicon "${D}/opt/Webex/bin/sparklogosmall.png"
}
