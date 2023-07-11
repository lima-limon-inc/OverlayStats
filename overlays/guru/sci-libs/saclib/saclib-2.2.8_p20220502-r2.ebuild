# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

COMMIT="4e5e3addfe4d75718b5a06e7ff0eaa332111d8fe"

DESCRIPTION="Reference implementations of algorithms and forms the basis of QEPCAD"
HOMEPAGE="
	https://www.usna.edu/Users/cs/wcbrown/qepcad/B/QEPCAD.html
	https://github.com/Alessandro-Barbieri/saclib
"
SRC_URI="https://github.com/Alessandro-Barbieri/${PN}/archive/${COMMIT}.tar.gz -> ${PF}.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64"

BDEPEND="app-shells/tcsh"

DOCS=( doc/saclib.pdf doc/saclocal.dvi README CHANGELOG )

src_prepare() {
	# no main, it's a library
	rm src/main.c || die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DSACLIB_DOC=OFF
	)
	cmake_src_configure
}

src_install() {
	einstalldocs
	cmake_src_install
}
