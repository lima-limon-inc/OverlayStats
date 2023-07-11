# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua{5-{1..4},jit} )
LUA_REQ_USE="deprecated(+)"

inherit lua toolchain-funcs git-r3

DESCRIPTION="Lua binding for OpenSSL library to provide TLS/SSL communication"
HOMEPAGE="https://github.com/brunoos/luasec"
EGIT_REPO_URI="https://github.com/brunoos/luasec"

LICENSE="MIT"
SLOT="0"
REQUIRED_USE="${LUA_REQUIRED_USE}"

RDEPEND="
	dev-lua/luasocket[${LUA_USEDEP}]
	dev-libs/openssl:0=
	${LUA_DEPS}
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

lua_src_prepare() {
	pushd "${BUILD_DIR}" || die
	${ELUA} src/options.lua -g /usr/include/openssl/ssl.h > src/options.c || die
	popd
}

src_prepare() {
	default
	# Respect users CFLAGS
	sed -e 's/-O2//g' -i src/Makefile || die
	lua_copy_sources
	lua_foreach_impl lua_src_prepare
}

lua_src_compile() {
	pushd "${BUILD_DIR}" || die
	local myemakeargs=(
		"CC=$(tc-getCC)"
		"LD=$(tc-getCC)"
		"INC_PATH=-I$(lua_get_include_dir)"
		"LIB_PATH=$(lua_get_CFLAGS)"
		"MYCFLAGS=${CFLAGS}"
		"MYLDFLAGS=${LDFLAGS}"
	)
	emake "${myemakeargs[@]}" linux
	popd
}

src_compile() {
	lua_foreach_impl lua_src_compile
}

lua_src_install() {
	pushd "${BUILD_DIR}" || die
	local emakeargs=(
		"DESTDIR=${ED}"
		"LUAPATH=$(lua_get_lmod_dir)"
		"LUACPATH=$(lua_get_cmod_dir)"
	)
	emake "${emakeargs[@]}" install
	popd
}

src_install() {
	lua_foreach_impl lua_src_install
	einstalldocs
}
