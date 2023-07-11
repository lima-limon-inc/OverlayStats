# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils git-r3

DESCRIPTION="A non-blocking Qt Style console class to easily handle stdin/out/err"
HOMEPAGE="https://github.com/Skycoder42/QConsole"
EGIT_REPO_URI="https://github.com/Skycoder42/QConsole.git"
EGIT_COMMIT="1.3.1"

LICENSE="BSD-3-Claues"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-qt/qtcore:5
"
RDEPEND="${DEPEND}"

# PATCHES=( "${FILESDIR}"/${P}-gentoo.patch )

src_prepare() {
	default

	sed -i 's/Q_CONSOLE_EXPORT//g ' qconsole.h
	cp -v ${FILESDIR}/qconsole.pro .
}

src_configure() {
	eqmake5 PREFIX="${EPREFIX}"/usr LIBDIR=$(get_libdir)
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
