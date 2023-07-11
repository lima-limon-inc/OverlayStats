# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake flag-o-matic

DESCRIPTION="A solver for package problems in CUDF format"
HOMEPAGE="
	https://github.com/potassco/aspcud
	https://potassco.org/aspcud/
"
SRC_URI="https://github.com/potassco/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND="
	dev-libs/boost:=
	test? ( dev-cpp/catch:0 )
"
RDEPEND="
	${DEPEND}
	sci-mathematics/clasp
	sci-mathematics/clingo
"
BDEPEND="dev-util/re2c"

RESTRICT="!test? ( test )"
PATCHES=( "${FILESDIR}/${P}-system-catch.patch" )

src_prepare() {
	rm libcudf/tests/catch.hpp || die
	cmake_src_prepare
}

src_configure() {
	append-cxxflags "-I/usr/include/catch2"
	local mycmakeargs=(
		-DASPCUD_BUILD_TESTS=$(usex test)

		-DASPCUD_BUILD_STATIC=OFF
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	insinto /usr/share/cudf/solvers/
	doins "${FILESDIR}/aspcud"
}
