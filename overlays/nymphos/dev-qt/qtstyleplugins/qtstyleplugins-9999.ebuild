# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 qmake-utils

DESCRIPTION="Additional style plugins for Qt5"
HOMEPAGE="https://code.qt.io/cgit/qt/${PN}.git"
EGIT_REPO_URI="https://code.qt.io/qt/${PN}.git"

LICENSE="LGPL-2.1"
SLOT="5"

RDEPEND="
	dev-qt/qtcore:5=
	dev-qt/qtgui:5=
	dev-qt/qtwidgets:5=
	x11-libs/gtk+:2
	x11-libs/libX11
	x11-libs/pango"
DEPEND="${RDEPEND}"

PATCHES=( "${FILESDIR}/fix-build-qt5.15.patch" )

src_configure() {
	eqmake5
}

src_install() {
	emake INSTALL_ROOT="${D}" install
	# remove unwanted styles and cmake files
	rm -f \
		"${ED}/usr/$(get_libdir)"/qt5/plugins/styles/lib{bb10styleplugin,qcleanlooksstyle,qmotifstyle,qplastiquestyle}.so \
		"${ED}/usr/$(get_libdir)"/cmake/Qt5Widgets/Qt5Widgets_{QBB10StylePlugin,QCleanlooksStylePlugin,QMotifStylePlugin,QPlastiqueStylePlugin}.cmake
}
