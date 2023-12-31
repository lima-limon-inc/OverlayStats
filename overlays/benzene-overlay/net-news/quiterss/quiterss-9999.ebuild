# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils xdg

DESCRIPTION="Qt-based RSS/Atom feed reader"
HOMEPAGE="https://quiterss.org"

if [[ ${PV} == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/QuiteRSS/quiterss.git"
	inherit git-r3
else
	SRC_URI="https://github.com/QuiteRSS/quiterss/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~x86 ~amd64-linux ~x86-linux"
	PATCHES=( "${FILESDIR}/${P}-install-appdata.patch" )
fi

LICENSE="GPL-3"
SLOT="0"

BDEPEND="dev-qt/linguist-tools:5
	virtual/pkgconfig
"
DEPEND=">=dev-db/sqlite-3.11.1:3
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtmultimedia:5
	dev-qt/qtnetwork:5[ssl]
	dev-qt/qtprintsupport:5
	dev-qt/qtsingleapplication[X,qt5(+)]
	dev-qt/qtsql:5[sqlite]
	dev-qt/qtwebkit:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -e "s/exists(.git)/0/" -e '/INSTALLS +=/ s/ target1//' -i QuiteRSS.pro || die
}

src_configure() {
	local myqmakeargs=(
		PREFIX="${EPREFIX}/usr"
		SYSTEMQTSA=1
	)
	eqmake5 "${myqmakeargs[@]}"
}

src_install() {
	emake INSTALL_ROOT="${D}" install
	einstalldocs
}
