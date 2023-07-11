# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit eutils cmake flag-o-matic  git-r3

DESCRIPTION="Lets you easily share a single mouse and keyboard between multiple computers"
HOMEPAGE="https://github.com/debauchee/barrier"

EGIT_REPO_URI="https://github.com/debauchee/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=
IUSE="libressl qt5"
RESTRICT="test"

DEPEND="
	!libressl? ( dev-libs/openssl:* )
	libressl? ( dev-libs/libressl )
	net-misc/curl
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXi
	x11-libs/libXinerama
	x11-libs/libXrandr
	x11-libs/libXtst
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
		net-dns/avahi[mdnsresponder-compat]
	)
	x11-base/xorg-proto
"

RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DBARRIER_BUILD_INSTALLER=OFF
		-DBARRIER_BUILD_GUI=$(usex qt5)
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	if use qt5; then
		newicon -s 256 "${S}"/res/${PN}.png ${PN}.png
		newmenu "${S}"/res/${PN}.desktop ${PN}.desktop
	fi
}
