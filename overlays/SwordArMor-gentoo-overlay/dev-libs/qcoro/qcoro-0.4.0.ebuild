# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

DESCRIPTION="C++ Coroutine library for Qt5 and Qt6"
HOMEPAGE="https://qcoro.dvratil.cz/"
MY_GITHUB_AUTHOR="danvratil"
SRC_URI="https://github.com/${MY_GITHUB_AUTHOR}/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="asan dbus +examples +network +shared test"
RESTRICT="test"

DEPEND="
	dbus? ( dev-qt/qtdbus )
	network? ( dev-qt/qtnetwork )
	dev-qt/qtcore:5
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DQCORO_BUILD_EXAMPLES=$(usex examples)
		-DQCORO_ENABLE_ASAN=$(usex asan)
		-DBUILD_SHARED_LIBS=$(usex shared)
		-DBUILD_TESTING=$(usex test)
		-DUSE_QT_VERSION=5
		-DQCORO_WITH_QTDBUS=$(usex dbus)
		-DQCORO_WITH_QTNETWORK=$(usex network)
	)

	cmake_src_configure
}

src_install() {
	if use examples; then
		dodoc -r examples
		dodoc -r "${BUILD_DIR}"/examples
	fi
	dodoc README.md

	cmake_src_install
}
