# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
MY_PN="${PN/s/S}"
BASE_URI="${MY_PN}-linux-v${PV}"
inherit desktop wrapper

DESCRIPTION="Join PIC on his awesome journey into the unknown armed with only his camera!"
HOMEPAGE="http://www.retroaffect.com/games/1/snapshot/"
SRC_URI="
	x86? ( ${BASE_URI}-x86.tar.gz )
	amd64? ( ${BASE_URI}-x64.tar.gz )
"

LICENSE="all-rights-reserved"
SLOT="0"
RESTRICT="fetch"
KEYWORDS="~amd64 ~x86"
IUSE="luajit"

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/json-c
	media-libs/aalib
	media-libs/alsa-lib
	media-libs/flac
	media-libs/glu
	media-libs/libogg
	media-libs/libsdl:0
	media-libs/libsndfile
	media-libs/libvorbis
	virtual/opengl
	media-libs/openal
	media-sound/pulseaudio
	net-libs/libasyncns
	sys-apps/attr
	sys-apps/dbus
	sys-apps/tcp-wrappers
	sys-apps/util-linux
	sys-devel/gcc
	sys-libs/gdbm
	sys-libs/glibc
	sys-libs/gpm
	sys-libs/libcap
	sys-libs/ncurses
	x11-libs/libdrm
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libxcb
	x11-libs/libXdamage
	x11-libs/libXdmcp
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXtst
	x11-libs/libXxf86vm
	|| ( dev-lang/luajit:2 dev-lang/lua:5.1 )
	luajit? ( dev-lang/luajit:2 )
	!luajit? ( dev-lang/lua:5.1 )
"
S="${WORKDIR}"

src_install() {
	local lib=liblua.so;
	dir="/opt/${PN}"

	use luajit && lib=libluajit-5.1.so

	# Unbundling
	rm "./libopenal.so.1"
	rm "./liblua5.1.so.0"
	rm "./libSDL-1.2.so.0"
	rm "./libvorbis.so.0"

	# Fixing bundled lua (requires non-standard soname)
	ln -s "/usr/$(get_libdir)/${lib}" "./liblua5.1.so.0"

	exeinto "${dir}"
	insinto "${dir}"
	doins -r "resources"
	doins "liblua5.1.so.0"
	doexe "${PN}.bin"

	doicon "${FILESDIR}/snapshot.png"
	# install shortcuts
	make_wrapper "${PN}" "./${PN}.bin" "${dir}" "${dir}" || die "install shortcut"
	make_desktop_entry "${PN}" "${PN}" "${PN}"
}
