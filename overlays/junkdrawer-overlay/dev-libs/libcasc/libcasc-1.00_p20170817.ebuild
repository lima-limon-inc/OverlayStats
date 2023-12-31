# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Library for reading CASC storage from Blizzard games since 2014"
HOMEPAGE="http://www.zezula.net/en/casc/main.html"
EGIT_COMMIT="fb9442155352b36e56b74a6c0d265b3b62d20e3a"
SRC_URI="https://github.com/ladislav-zezula/CascLib/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"
IUSE="system-libtomcrypt"

DEPEND="app-arch/bzip2
		sys-libs/zlib
		system-libtomcrypt? ( dev-libs/libtomcrypt )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/CascLib-${EGIT_COMMIT}"

src_configure() {
	local mycmakeargs=(
		-DWITH_LIBTOMCRYPT="$(usex system-libtomcrypt)"
	)

	cmake_src_configure
}
