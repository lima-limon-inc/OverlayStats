# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit python-any-r1 scons-utils git-r3

DESCRIPTION="An open source implementation of the RealLive virtual machine for Linux and OSX"
HOMEPAGE="https://github.com/eglaysher/${PN}"
EGIT_REPO_URI="${HOMEPAGE}.git"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	>=dev-games/guichan-0.8[opengl,sdl]
	>=dev-libs/boost-1.42:0=
	media-libs/glew:0=
	media-libs/libmad
	media-libs/libsdl[opengl]
	media-libs/sdl-image[jpeg,png]
	media-libs/sdl-mixer[vorbis]
	media-libs/sdl-ttf
	x11-libs/gtk+:3"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/${PN}-include-memory.patch"
	"${FILESDIR}/${PN}-gtk+3.patch"
	"${FILESDIR}/${PN}-custom-flags.patch"
)

src_compile() {
	escons --release CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" || die "build failed"
}

src_install() {
	dobin "build/${PN}"
	doman "debian/${PN}.6"
	dodoc README.md {AUTHORS,NEWS,STATUS}.TXT
}
