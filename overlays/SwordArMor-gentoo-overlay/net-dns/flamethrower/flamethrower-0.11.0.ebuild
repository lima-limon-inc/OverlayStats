# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

DESCRIPTION="DNS performance and functional testing utility"
HOMEPAGE="https://github.com/DNS-OARC/flamethrower"
SRC_URI="https://github.com/DNS-OARC/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doh"

DEPEND="
	>=dev-libs/libuv-1.30.0
	>=net-libs/ldns-1.7.0
	doh? ( net-libs/nghttp2 )
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/${P}-gcc12.patch"
	"${FILESDIR}/${P}-cmakelist.patch"
)

src_prepare() {
	rm 3rd/catch/catch2/catch.hpp
	rm tests/main.cpp

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DDOH_ENABLE="$(usex doh)"
	)

	cmake_src_configure
}
