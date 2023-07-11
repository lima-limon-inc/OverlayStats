# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Generic command-line automation tool (no X!)"

HOMEPAGE="https://github.com/ReimuNotMoe/ydotool"
SRC_URI="https://github.com/ReimuNotMoe/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-libs/boost
		<=dev-libs/libevdevplus-0.1.1
		<=dev-libs/libuinputplus-0.1.4"
DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=(
		-DSTATIC_BUILD=0
		-DCMAKE_BUILD_TYPE=Release
	)
	cmake_src_configure
}
