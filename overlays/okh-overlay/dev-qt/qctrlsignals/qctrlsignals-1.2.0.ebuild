# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils git-r3

DESCRIPTION="Qt based library to catch and handle windows and unix signals, in a cross platform manner."
HOMEPAGE="https://github.com/Skycoder42/QCtrlSignals"
EGIT_REPO_URI="https://github.com/Skycoder42/QCtrlSignals.git"
EGIT_COMMIT="1.2.0"

LICENSE="BSD-3-Claues"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-qt/qtcore:5
"
RDEPEND="${DEPEND}"

src_prepare() {
	default

	sed -i 's/Q_CTRL_SIGNALS_EXPORT//g' src/qctrlsignalhandler.h
	cp -v ${FILESDIR}/qctrlsignals.pro .
}

src_configure() {
	eqmake5 PREFIX="${EPREFIX}"/usr LIBDIR=$(get_libdir)
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
