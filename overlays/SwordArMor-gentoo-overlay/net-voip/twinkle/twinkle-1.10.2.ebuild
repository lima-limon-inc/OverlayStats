# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake xdg-utils

DESCRIPTION="Twinkle is a SIP-based VoIP client."
HOMEPAGE="http://twinkle.dolezel.info"

SRC_URI="https://github.com/LubosD/twinkle/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"

IUSE="alsa g729 gsm +qt5 speex"

RDEPEND="
	dev-libs/ucommon:=
	media-libs/ccrtp
	dev-libs/libxml2
	media-libs/libsndfile
	sys-apps/file
	sys-libs/readline:=

	qt5? (
		dev-qt/qtdeclarative:=[widgets]
	)

	alsa? ( media-libs/alsa-lib )
	speex? ( media-libs/speex )
	g729? ( media-libs/bcg729 )
	gsm? ( media-sound/gsm )
"

DEPEND="${RDEPEND}"

BDEPEND="
	qt5? ( dev-qt/linguist-tools )
	sys-devel/bison
	sys-devel/flex
"

src_configure() {
	local mycmakeargs=(
		-DWITH_QT5=$(usex qt5)
		-DWITH_ZRTP=OFF # not ported yet
		-DWITH_ALSA=$(usex alsa)
		-DWITH_SPEEX=$(usex speex)
		-DWITH_ILBC=OFF # requires old version
		-DWITH_G729=$(usex g729) # broken as well
		-DWITH_GSM=$(usex gsm)
	)
	cmake_src_configure
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
