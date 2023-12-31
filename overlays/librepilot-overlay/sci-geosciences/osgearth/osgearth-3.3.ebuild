# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit cmake git-r3

DESCRIPTION="Dynamic map generation toolkit for OpenSceneGraph"
HOMEPAGE="http://osgearth.org/"
#SRC_URI="https://github.com/gwaldron/osgearth/archive/${P}.tar.gz"

EGIT_REPO_URI="https://github.com/gwaldron/osgearth/"
EGIT_COMMIT="${P}"
EGIT_MIN_CLONE_TYPE="shallow"

LICENSE="LGPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc qt5"

RDEPEND="
	dev-db/sqlite:3
	>=dev-games/openscenegraph-3.5.5[curl]
	dev-libs/protobuf
	net-misc/curl
	sci-libs/gdal
	sci-libs/geos
	sys-libs/zlib[minizip]
	virtual/opengl
	x11-libs/libX11
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtopengl:5
		>=dev-games/openscenegraph-qt-3.5.5
	)
	doc? (
		dev-python/recommonmark
		=dev-python/sphinx-markdown-tables-0.0.9
	)"

RDEPEND="${RDEPEND}
	virtual/pkgconfig
	doc? ( dev-python/sphinx )"

S=${WORKDIR}/${P}

PATCHES=(
	"${FILESDIR}"/${PN}-3.3-cmake-gnuinstalldirs.patch
#	"${FILESDIR}"/${PN}-2.7-linker.patch
)

src_configure() {
	# V8 disabled due to
	# https://github.com/gwaldron/osgearth/issues/333
	local mycmakeargs=(
		-DWITH_EXTERNAL_TINYXML=OFF
		-DOpenGL_GL_PREFERENCE=GLVND
	)

	cmake_src_configure
}

src_compile() {
	cmake_src_compile

	if use doc ; then
		emake -C "${S}"/docs man html info
	fi
}

src_install() {
	cmake_src_install

	if use doc ; then
		docinto html
		dodoc -r "${S}"/docs/build/html/*
		doman "${S}"/docs/build/man/*
		doinfo "${S}"/docs/build/texinfo/*.info*
	fi
}

