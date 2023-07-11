# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils git-r3

DESCRIPTION="A fork of libqtelegram by Aseman Team"
HOMEPAGE="https://github.com/Aseman-Land/libqtelegram-aseman-edition"
EGIT_REPO_URI="https://github.com/Aseman-Land/libqtelegram-aseman-edition.git"
RESTRICT="mirror"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtdeclarative:5
	dev-qt/qtsql:5
	dev-qt/qtmultimedia:5[qml]
	dev-qt/qtgraphicaleffects:5
	dev-qt/qtgui:5
	dev-qt/qtquickcontrols:5
	dev-libs/openssl:=
"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i 's/\/$$LIB_PATH//g' ./libqtelegram-ae.pro
	default
}

src_configure() {
	QT_SELECT=5 ./init
	eqmake5 PREFIX="${EPREFIX}/usr" CONFIG+=typeobjects INSTALL_LIBS_PREFIX="${EPREFIX}/usr/$(get_libdir)" QMAKE_CFLAGS_ISYSTEM= libqtelegram-ae.pro
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
