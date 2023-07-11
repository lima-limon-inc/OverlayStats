# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

URELEASE="jammy"
inherit autotools eutils ubuntu-versionator vala virtualx

UVER_PREFIX="+19.04.${PVR_MICRO}"

DESCRIPTION="Home scope that aggregates results from multiple scopes for the Unity desktop"
HOMEPAGE="https://launchpad.net/unity-scope-home"
SRC_URI="${UURL}/${PN}_${PV}${UVER_PREFIX}.orig.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="mirror"

DEPEND="dev-lang/vala:0.52
	dev-libs/dee:=
	dev-libs/glib:2
	dev-libs/json-glib
	dev-libs/libgee
	dev-libs/libunity:=
	net-libs/libsoup
	net-libs/liboauth
	sys-apps/util-linux
	unity-base/unity"

S="${WORKDIR}"

src_prepare() {
	ubuntu-versionator_src_prepare
	eapply -p1 "${FILESDIR}/0002-productsearch.ubuntu.com-only-accepts-locale-string.patch"
	vala_src_prepare
	export VALAC=$(type -P valac-0.52)
	export VALA_API_GEN="$VAPIGEN"
	eautoreconf
}

src_configure() {
	use test || \
		local myconf="--enable-headless-tests=no"
	econf "${myconf}"
}
