# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="C++ string template engine based on the Django template system"
HOMEPAGE="https://github.com/steveire/grantlee"
EGIT_REPO_URI=( "https://github.com/steveire/${PN}" )

LICENSE="LGPL-2.1+"
SLOT="5"
KEYWORDS=""
IUSE="doc test"

RESTRICT="!test? ( test )"

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtdeclarative:5
	dev-qt/qtgui:5
"
DEPEND="${RDEPEND}
	test? ( dev-qt/qttest:5 )
"
BDEPEND="
	doc? ( app-doc/doxygen[dot] )
	test? ( dev-qt/linguist-tools:5 )
"

PATCHES=(
	"${FILESDIR}/${PN}-0.3.0-nonfatal-warnings.patch"
	"${FILESDIR}/${PN}-5.3.0-slot.patch" # TODO: Qt5 specific
)

src_configure() {
	local mycmakeargs=(
		-DGRANTLEE_BUILD_WITH_QT6=OFF
		-DBUILD_TESTS=$(usex test)
	)

	cmake_src_configure
}

src_compile() {
	cmake_src_compile

	use doc && cmake_src_compile docs
}

src_test() {
	local -x QT_QPA_PLATFORM="offscreen"
	cmake_src_test
}

src_install() {
	use doc && local HTML_DOCS=( "${BUILD_DIR}/apidox/" )

	cmake_src_install
}
