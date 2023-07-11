# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_TEST="false"
KDE_ORG_CATEGORY=plasma-mobile
KFMIN=5.88.0
QTMIN=5.15.4
inherit ecm kde.org

DESCRIPTION="Library for retrieval of weather information including forecasts and alerts"
HOMEPAGE="https://apps.kde.org/kweather/"

if [[ ${KDE_BUILD_TYPE} = release ]]; then
	SRC_URI="mirror://kde/stable/${KDE_ORG_CATEGORY}/${P}.tar.xz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-2+"
SLOT="5"

DEPEND="
	dev-libs/kweathercore
	>=dev-qt/qtcharts-${QTMIN}:5[qml]
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=dev-qt/qtsvg-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
	>=kde-frameworks/knotifications-${KFMIN}:5
	>=kde-frameworks/plasma-${KFMIN}:5
"
RDEPEND="${DEPEND}
	>=dev-qt/qtgraphicaleffects-${QTMIN}:5
	>=dev-qt/qtpositioning-${QTMIN}:5
"

src_prepare() {
	ecm_src_prepare

	sed -e "/include(ECMCheckOutboundLicense)/s/^/#DONT /" \
		-e "/ecm_check_outbound_license/s/^/#DONT /" \
		-i CMakeLists.txt || die # avoid cmake spam about python, reusetool
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_PLASMOID=ON
	)
	ecm_src_configure
}
