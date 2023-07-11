# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/free-sm/geonkick/archive/v${PV}.tar.gz  -> ${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/free-sm/geonkick.git"
fi

DESCRIPTION="A free software percussion synthesizer"
HOMEPAGE="https://github.com/free-sm/geonkick"
LICENSE="GPL-3"
SLOT="0"
IUSE="+standalone +lv2 +vst3"
REQUIRED_USE="vst3? ( lv2 )"

DEPEND="
	dev-libs/rapidjson
	media-libs/libsndfile
	media-libs/lv2
"
RDEPEND="${DEPEND}"
BDEPEND="
	>=dev-util/cmake-3.7
"

src_configure() {
	local mycmakeargs=(
		-DGKICK_STANDALONE=$(usex standalone "ON" "OFF")
		-DGKICK_PLUGIN=$(usex lv2 "ON" "OFF")
		-DGKICK_VST3=$(usex vst3 "ON" "OFF")
	)
	cmake_src_configure
}
