# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_ECLASS=cmake
PYTHON_COMPAT=( python3_{7..10} )
inherit cmake-multilib desktop multilib python-single-r1

DESCRIPTION="Tool for tracing, analyzing, and debugging graphics APIs"
HOMEPAGE="https://github.com/apitrace/apitrace"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/apitrace/apitrace"
	inherit git-r3
else
	SRC_URI="https://github.com/${PN}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE="qt5 X"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}
	app-arch/brotli:=[${MULTILIB_USEDEP}]
	>=app-arch/snappy-1.1.1[${MULTILIB_USEDEP}]
	media-libs/libpng:0=
	media-libs/mesa[egl(+),gles1,gles2,X?,${MULTILIB_USEDEP}]
	>=media-libs/waffle-1.6.0-r1[egl,${MULTILIB_USEDEP}]
	sys-libs/zlib[${MULTILIB_USEDEP}]
	sys-process/procps:=[${MULTILIB_USEDEP}]
	X? ( x11-libs/libX11 )
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtgui:5[-gles2-only]
		dev-qt/qtnetwork:5
		dev-qt/qtwidgets:5[-gles2-only]
	)
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}"/${PN}-4.0-disable-cli.patch
	"${FILESDIR}"/${PN}-4.0-disable-multiarch.patch
	"${FILESDIR}"/Remove-check-for-cleaned-thirdparty-libraries.patch
)

src_prepare() {
	cmake_src_prepare

	# The apitrace code grubs around in the internal zlib structures.
	# We have to extract this header and clean it up to keep that working.
	# Do not be surprised if a zlib upgrade breaks things ...
	rm -rf thirdparty/{brotli,snappy,getopt,less,libpng,zlib,dxerr,directxtex,devcon} || die
}

src_configure() {
	my_configure() {
		local mycmakeargs=(
			-DDOC_INSTALL_DIR="${EPREFIX}"/usr/share/doc/${PF}
			-DENABLE_X11=$(usex X)
			-DENABLE_EGL=ON
			-DENABLE_CLI=ON
			-DENABLE_GUI=$(multilib_native_usex qt5)
			-DENABLE_STATIC_SNAPPY=OFF
			-DENABLE_WAFFLE=ON
			-DPYTHON_EXECUTABLE="${PYTHON}"
		)
		cmake_src_configure
	}

	multilib_foreach_abi my_configure
}

src_install() {
	MULTILIB_CHOST_TOOLS=(
		/usr/bin/apitrace$(get_exeext)
		/usr/bin/eglretrace$(get_exeext)
		/usr/bin/gltrim$(get_exeext)
	)
	use X && MULTILIB_CHOST_TOOLS+=( /usr/bin/glretrace$(get_exeext) )

	cmake-multilib_src_install

	make_libgl_symlinks() {
		dosym glxtrace.so /usr/$(get_libdir)/${PN}/wrappers/libGL.so
		dosym glxtrace.so /usr/$(get_libdir)/${PN}/wrappers/libGL.so.1
		dosym glxtrace.so /usr/$(get_libdir)/${PN}/wrappers/libGL.so.1.2
	}
	use X && multilib_foreach_abi make_libgl_symlinks

	make_desktop_entry qapitrace QApitrace media-playback-start Development;
}
