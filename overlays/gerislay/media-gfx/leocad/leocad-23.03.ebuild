# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils eutils

DESCRIPTION="LeoCAD is a CAD program that uses bricks similar to those found in many toys."
HOMEPAGE="http://www.leocad.org"

BASE_URI="https://github.com/leozide/leocad"


if [[ ${PV} == *9999* ]];then
	inherit git-r3
	EGIT_REPO_URI="${BASE_URI}"
	SRC_URI=""
	KEYWORDS=""
else
	LIB_NUM="23.01"
	SRC_URI="
		${BASE_URI}/archive/v${PV}.tar.gz -> ${P}.tar.gz
		${BASE_URI}/releases/download/v${PV}/Library-${LIB_NUM}.zip
	"
	KEYWORDS="~x86 ~amd64 ~arm"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtopengl:5
	dev-qt/qtconcurrent:5
"
RDEPEND="${DEPEND}
	x11-themes/hicolor-icon-theme"

src_configure(){
	eqmake5 ${PN}.pro DISABLE_UPDATE_CHECK=1
}

src_install(){
	emake INSTALL_ROOT="${D}" install
	insinto /usr/share/${PN}
	doins "${WORKDIR}/library.bin"
}
