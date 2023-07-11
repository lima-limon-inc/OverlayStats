# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.vrsal.xyz/alex/tuna.git"
else
	SRC_URI="https://git.vrsal.xyz/alex/tuna/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	MY_PN="tuna"
	S="${WORKDIR}/${MY_PN}"
fi

DESCRIPTION="OBS song information plugin"
HOMEPAGE="https://obsproject.com/forum/resources/tuna.843/"
LICENSE="GPL-2"
SLOT="0"

DEPEND="
	dev-qt/qtwidgets:5
	media-video/obs-studio
	net-misc/curl
"
# media-libs/libmpdclient
# media-libs/taglib
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	# TODO: Fix submodule dependencies
	sed -i "s;/lib/;/$(get_libdir)/;g" "${S}/CMakeLists.txt"
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		"-DGLOBAL_INSTALLATION=ON"
	)
	cmake_src_configure
}
