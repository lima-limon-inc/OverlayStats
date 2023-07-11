# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

URELEASE="jammy"
inherit vala autotools ubuntu-versionator

UVER="-${PVR_MICRO}"

DESCRIPTION="Dock panel famious docky"
HOMEPAGE="https://launchpad.net/plank"
SRC_URI="${UURL}/${MY_P}.orig.tar.xz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+introspection doc static-libs"
RESTRICT="mirror"
RDEPEND="dev-libs/glib:2
	dev-libs/libdbusmenu
	dev-libs/libgee:0.8
	unity-base/bamf
	x11-libs/gtk+:3
	x11-libs/libwnck:3
	x11-libs/libX11"
DEPEND="${RDEPEND}
	dev-util/intltool
	gnome-base/gnome-common
	sys-devel/gettext
	virtual/pkgconfig
	$(vala_depend)"

src_prepare() {
	ubuntu-versionator_src_prepare
	eautoreconf
#	NOCONFIGURE=1 REQUIRED_PKG_CONFIG_VERSION=0.1 ./autogen.sh
	vala_src_prepare
}

src_install() {
	emake DESTDIR="${ED}" install

	# Delete some files that are only useful on Ubuntu
	rm -rf "${ED}"/{etc,usr/share}/apport

	# Remove unused libtool libarchive files #
	find "${ED}" -name '*.la' -delete || die
}
