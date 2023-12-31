# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..10} )

inherit eutils python-single-r1 toolchain-funcs xdg

SRC_URI="https://github.com/kovidgoyal/${PN}/releases/download/v${PV}/${P}.tar.xz"
KEYWORDS="~amd64 ~x86"

DESCRIPTION="A modern, hackable, featureful, OpenGL-based terminal emulator"
HOMEPAGE="https://sw.kovidgoyal.net/${PN}"

LICENSE="GPL-3"
SLOT="0"
IUSE="debug doc imagemagick wayland"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	media-libs/fontconfig
	media-libs/freetype:2
	>=media-libs/harfbuzz-1.5.0:=
	media-libs/libcanberra
	media-libs/libpng:0=
	sys-apps/dbus
	sys-libs/zlib
	x11-libs/libxcb[xkb]
	x11-libs/libXcursor
	x11-libs/libXi
	x11-libs/libXinerama
	x11-libs/libxkbcommon[X]
	x11-libs/libXrandr
	x11-terms/kitty-terminfo
	wayland? (
		dev-libs/wayland
		>=dev-libs/wayland-protocols-1.17
	)
	$(python_gen_cond_dep 'dev-python/importlib_resources[${PYTHON_MULTI_USEDEP}]' python3_6)
	imagemagick? ( virtual/imagemagick-tools )
"

DEPEND="${RDEPEND}
	media-libs/mesa[X(+)]
	sys-libs/ncurses
"

BDEPEND="virtual/pkgconfig"

[[ ${PV} == *9999 ]] && BDEPEND+=" >=dev-python/sphinx-1.7"

PATCHES=(
	"${FILESDIR}"/${PN}-0.17.2-flags.patch
	"${FILESDIR}"/${PN}-0.14.4-svg-icon.patch
	"${FILESDIR}"/${PN}-0.16.0-remove-terminfo.patch
)

src_prepare() {
	default

	# disable wayland as required
	if ! use wayland; then
		sed -i "/'x11 wayland'/s/ wayland//" setup.py || die
	fi

	# respect doc dir
	sed -i "/htmldir =/s/appname/'${PF}'/" setup.py || die

	tc-export CC
}

src_compile() {
	"${EPYTHON}" setup.py \
		--verbose $(usex debug --debug "") \
		--libdir-name $(get_libdir) \
		linux-package || die "Failed to compile kitty."
}

src_test() {
	export KITTY_CONFIG_DIRECTORY=${T}
	"${EPYTHON}" test.py || die
}

src_install() {
	insinto /usr
	doins -r linux-package/*
	dobin linux-package/bin/kitty
	python_fix_shebang "${ED}"

	if ! use doc; then
		rm -r "${ED}"/usr/share/doc || die
	fi
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
