# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake readme.gentoo-r1

DESCRIPTION="Friendly Interactive SHell"
HOMEPAGE="http://fishshell.com/"

MY_PV="${PV/_beta/b}"
MY_P="${PN}-${MY_PV}"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/${PN}-shell/${PN}-shell.git"
else
	SRC_URI="https://github.com/${PN}-shell/${PN}-shell/releases/download/${MY_PV}/${MY_P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
fi

LICENSE="GPL-2"
SLOT="0"

IUSE="doc nls test"

RDEPEND="
	>=dev-libs/libpcre2-10.32[pcre32]
	sys-libs/ncurses:0=[unicode]
"

DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )
	nls? ( sys-devel/gettext )
	test? ( dev-tcltk/expect )
"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	# workaround for https://github.com/fish-shell/fish-shell/issues/4883
	sed -i 's#${TEST_INSTALL_DIR}/${CMAKE_INSTALL_PREFIX}#${TEST_INSTALL_DIR}#' \
		cmake/Tests.cmake || die
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_BINDIR="${EPREFIX}/bin"
		-DCMAKE_INSTALL_DOCDIR="share/doc/${PF}"
		-DCMAKE_INSTALL_SYSCONFDIR="${EPREFIX}/etc"
		-DCURSES_NEED_NCURSES=ON
		-DINTERNAL_WCWIDTH=OFF
		-DBUILD_DOCS="$(usex doc)"
		-DWITH_GETTEXT="$(usex nls)"
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	keepdir /usr/share/fish/vendor_{completions,conf,functions}.d
	readme.gentoo_create_doc
}

src_test() {
	cmake-utils_src_make -j1 test
}

pkg_postinst() {
	readme.gentoo_print_elog
}
