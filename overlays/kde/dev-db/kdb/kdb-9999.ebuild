# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_QTHELP="true"
ECM_TEST="true"
PYTHON_COMPAT=( python3_{10..11} )
KFMIN=5.106.0
QTMIN=5.15.9
inherit ecm kde.org python-any-r1

DESCRIPTION="Database connectivity and creation framework for various vendors"
HOMEPAGE="https://community.kde.org/KDb"

if [[ ${KDE_BUILD_TYPE} = release ]]; then
	SRC_URI="mirror://kde/stable/${PN}/src/${P}.tar.xz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="LGPL-2+"
SLOT="5/4"
IUSE="debug mysql postgres sqlite"

DEPEND="
	dev-libs/icu:=
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=dev-qt/qtxml-${QTMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	mysql? ( dev-db/mysql-connector-c:= )
	postgres? (
		dev-db/postgresql:*
		>=dev-qt/qtnetwork-${QTMIN}:5
	)
	sqlite? ( dev-db/sqlite:3 )
"
RDEPEND="${DEPEND}"
BDEPEND="${PYTHON_DEPS}
	dev-qt/linguist-tools:5
"

pkg_setup() {
	python-any-r1_pkg_setup
	ecm_pkg_setup
}

src_configure() {
	local mycmakeargs=(
		-DKDB_DEBUG_GUI=$(usex debug)
		$(cmake_use_find_package mysql MySQL)
		$(cmake_use_find_package postgres PostgreSQL)
		$(cmake_use_find_package sqlite Sqlite)
	)

	ecm_src_configure
}
