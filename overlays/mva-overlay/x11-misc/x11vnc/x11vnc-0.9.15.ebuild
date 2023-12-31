# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit autotools vcs-snapshot

DESCRIPTION="A VNC server for real X displays"
HOMEPAGE="https://libvnc.github.io/"
SRC_URI="https://github.com/LibVNC/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86 ~amd64-linux ~arm-linux ~x86-linux ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE="crypt fbcon ssl xinerama zeroconf"

RDEPEND=">=net-libs/libvncserver-0.9.8[ssl?]
	x11-libs/libX11
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrandr
	>=x11-libs/libXtst-1.1.0
	ssl? (
		dev-libs/openssl:0=
	)
	xinerama? ( x11-libs/libXinerama )
	zeroconf? ( >=net-dns/avahi-0.6.4 )
"
DEPEND="${RDEPEND}
	x11-libs/libXt
	x11-base/xorg-proto
"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	# --without-v4l because of missing video4linux 2.x support wrt #389079
	econf \
		$(use_with crypt) \
		$(use_with fbcon fbdev) \
		$(use_with ssl) \
		$(use_with ssl crypto) \
		--without-v4l \
		$(use_with xinerama) \
		$(use_with zeroconf avahi)
}

src_install() {
	default
	doinitd "${FILESDIR}/x11vnc.init.d"
	doconfd "${FILESDIR}/x11vnc.conf.d"
}
