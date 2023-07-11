# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake flag-o-matic

DESCRIPTION="Client API library for Matrix, built on top of libcurl"
HOMEPAGE="https://github.com/Nheko-Reborn/mtxclient"
SRC_URI="https://github.com/Nheko-Reborn/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}" # ABI may break even on patch version changes
KEYWORDS="~amd64"

IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-libs/libfmt:=
	dev-libs/olm
	>=dev-libs/openssl-1.1.0:=
	dev-libs/spdlog:=
	>=dev-cpp/coeurl-0.2.1:=[ssl]
	dev-libs/re2
"
DEPEND="
	${RDEPEND}
	dev-cpp/nlohmann_json
	test? ( dev-cpp/gtest )
"

PATCHES=(
	"${FILESDIR}/0.6.0_remove_network_tests.patch"
)

src_prepare() {
	if use test; then
		filter-lto # bug 861731
	fi

	cmake_src_prepare
}

src_configure() {
	local -a mycmakeargs=(
		-DBUILD_LIB_TESTS="$(usex test)"
		-DBUILD_LIB_EXAMPLES=OFF
	)

	cmake_src_configure
}
