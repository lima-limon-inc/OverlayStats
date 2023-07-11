# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_HANDBOOK="forceoptional"
KDE_ORG_CATEGORY="office"
KFMIN=5.106.0
QTMIN=5.15.9
MY_P=${P/_beta/b}
inherit ecm kde.org

DESCRIPTION="Latex Editor and TeX shell based on KDE Frameworks"
HOMEPAGE="https://apps.kde.org/kile/ https://kile.sourceforge.io/"

if [[ ${KDE_BUILD_TYPE} == release ]]; then
	SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.bz2"
	KEYWORDS="~amd64 ~arm64 ~riscv ~x86"
fi

LICENSE="FDL-1.2 GPL-2"
SLOT="5"
IUSE="+pdf +png"

DEPEND="
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtscript-${QTMIN}:5
	>=dev-qt/qttest-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	kde-apps/okular:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kcrash-${KFMIN}:5
	>=kde-frameworks/kdbusaddons-${KFMIN}:5
	>=kde-frameworks/kdoctools-${KFMIN}:5
	>=kde-frameworks/kguiaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kiconthemes-${KFMIN}:5
	>=kde-frameworks/kio-${KFMIN}:5
	>=kde-frameworks/kparts-${KFMIN}:5
	>=kde-frameworks/ktexteditor-${KFMIN}:5
	>=kde-frameworks/kwindowsystem-${KFMIN}:5
	>=kde-frameworks/kxmlgui-${KFMIN}:5
	pdf? ( app-text/poppler[qt5] )
"
RDEPEND="${DEPEND}
	kde-apps/konsole:5
	kde-apps/okular:5[pdf?]
	virtual/latex-base
	virtual/tex-base
	pdf? (
		app-text/ghostscript-gpl
		app-text/texlive-core
	)
	png? (
		app-text/dvipng
		virtual/imagemagick-tools[png?]
	)
"

DOCS=( kile-remote-control.txt )

S=${WORKDIR}/${MY_P}

PATCHES=( "${FILESDIR}/${PN}-2.9.93_p20221123-cmake.patch" )

src_configure() {
	local mycmakeargs=(
		$(cmake_use_find_package pdf Poppler)
	)
	ecm_src_configure
}
