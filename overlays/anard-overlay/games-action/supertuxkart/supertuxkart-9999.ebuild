# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake desktop xdg
inherit git-r3 subversion

DESCRIPTION="A kart racing game starring Tux, the linux penguin (TuxKart fork)"
HOMEPAGE="https://supertuxkart.net/"
SRC_URI="mirror://gentoo/${PN}.png"
EGIT_REPO_URI="https://github.com/${PN}/stk-code.git"
EGIT_BRANCH="master"
ESVN_REPO_URI="https://svn.code.sf.net/p/${PN}/code/stk-assets"

LICENSE="GPL-2 GPL-3 CC-BY-SA-3.0 CC-BY-SA-4.0 CC0-1.0 public-domain ZLIB"
SLOT="0"
KEYWORDS=""
IUSE="debug nettle recorder sqlite vulkan wiimote"

# don't unbundle irrlicht and bullet
# both are modified and system versions will break the game
# https://sourceforge.net/p/irrlicht/feature-requests/138/

RDEPEND="
	dev-cpp/libmcpp
	sqlite? ( dev-db/sqlite:3 )
	dev-libs/angelscript:=
	media-libs/freetype:2
	media-libs/harfbuzz:=
	media-libs/libpng:0=
	media-libs/libsdl2
	media-libs/libvorbis
	media-libs/openal
	net-libs/enet:1.3=
	net-misc/curl
	sys-libs/zlib
	virtual/glu
	virtual/jpeg:0
	virtual/libintl
	virtual/opengl
	x11-libs/libX11
	x11-libs/libXxf86vm
	nettle? ( dev-libs/nettle:= )
	!nettle? (
		>=dev-libs/openssl-1.0.1d:0=
	)
	recorder? ( media-libs/libopenglrecorder )
	vulkan? ( media-libs/shaderc )
	wiimote? ( net-wireless/bluez )"
DEPEND="${RDEPEND}"
BDEPEND="
	sys-devel/gettext
	virtual/pkgconfig"

PATCHES=(
	"${FILESDIR}"/${PN}-1.1-irrlicht-arch-support.patch
	"${FILESDIR}"/${PN}-1.3-irrlicht-system-libs.patch
)

src_unpack() {
	git-r3_fetch
	git-r3_checkout
	subversion_fetch "${ESVN_REPO_URI}" data
}

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DUSE_SQLITE3=$(usex sqlite)
		-DUSE_SYSTEM_ANGELSCRIPT=ON
		-DUSE_SYSTEM_ENET=ON
		-DUSE_SYSTEM_SQUISH=OFF
		-DUSE_SYSTEM_WIIUSE=OFF
		-DUSE_IPV6=OFF # not supported by system enet
		-DOpenGL_GL_PREFERENCE=GLVND
		-DUSE_CRYPTO_OPENSSL=$(usex nettle no yes)
		-DBUILD_RECORDER=$(usex recorder)
		-DNO_SHADERC=$(usex vulkan off on)
		-DUSE_WIIUSE=$(usex wiimote)
		-DSTK_INSTALL_BINARY_DIR=bin
		-DSTK_INSTALL_DATA_DIR=share/${PN}
		-DBUILD_SHARED_LIBS=OFF # build bundled libsquish as static library
		-DCHECK_ASSETS=OFF
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	dodoc CHANGELOG.md

	doicon -s 64 "${DISTDIR}"/${PN}.png
}
