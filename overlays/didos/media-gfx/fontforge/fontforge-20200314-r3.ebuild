# Copyright 2004-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6..10} )

inherit python-single-r1 xdg cmake

DESCRIPTION="postscript font editor and converter"
HOMEPAGE="https://${PN}.org/"
SRC_URI="https://github.com/${PN}/${PN}/releases/download/${PV}/${PN}-${PV}.tar.xz"

LICENSE="BSD GPL-3+"
SLOT="0"
KEYWORDS="~alpha amd64 arm ~arm64 ~hppa ~ia64 ~mips ppc ~ppc64 ~s390 ~sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE="doc truetype-debugger extras gif gtk gui jpeg libspiro png +python readline test tiff svg unicode woff2 X"
RESTRICT="!test? ( test )"

REQUIRED_USE="
	gui? ( ?? ( gtk X ) )
	python? ( ${PYTHON_REQUIRED_USE} )
"

RDEPEND="
	dev-libs/glib:2
	dev-libs/libltdl:0
	dev-libs/libxml2:2=
	>=media-libs/freetype-2.3.7:2=
	gif? ( media-libs/giflib:0= )
	jpeg? ( virtual/jpeg:0 )
	png? ( media-libs/libpng:0= )
	tiff? ( media-libs/tiff:0= )
	truetype-debugger? ( >=media-libs/freetype-2.3.8:2[fontforge,-bindist(-)] )
	gtk? ( >=x11-libs/gtk+-3.10:3 )
	X? (
		>=x11-libs/cairo-1.6:0=
		>=x11-libs/pango-1.10:0=[X]
		x11-libs/libX11:0=
		x11-libs/libXi:0=
	)
	python? ( ${PYTHON_DEPS} )
	libspiro? ( media-libs/libspiro )
	readline? ( sys-libs/readline:0= )
	unicode? ( media-libs/libuninameslist:0= )
	woff2? ( media-libs/woff2:0= )
"
DEPEND="${RDEPEND}
	X? ( x11-base/xorg-proto )
"
BDEPEND="
	sys-devel/gettext
	doc? ( dev-python/sphinx )
	python? ( ${PYTHON_DEPS} )
	test? ( ${RDEPEND} )
"

PATCHES=(
	"${FILESDIR}"/20200314-stylemap.patch
	"${FILESDIR}"/20200314-tilepath.patch
)

pkg_setup() {
	:
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_DOCS=$(usex doc ON OFF)
		-DENABLE_LIBGIF=$(usex gif ON OFF)
		-DENABLE_LIBJPEG=$(usex jpeg ON OFF)
		-DENABLE_LIBPNG=$(usex png ON OFF)
		-DENABLE_LIBREADLINE=$(usex readline ON OFF)
		-DENABLE_LIBSPIRO=$(usex libspiro ON OFF)
		-DENABLE_LIBTIFF=$(usex tiff ON OFF)
		-DENABLE_LIBUNINAMESLIST=$(usex unicode ON OFF)
		-DENABLE_PYTHON_EXTENSION=$(usex python ON OFF)
		-DENABLE_GUI=$(usex gui ON OFF)
		-DENABLE_X11=$(usex X ON OFF)
		-DENABLE_PYTHON_SCRIPTING=$(usex python ON OFF)
		-DENABLE_TILE_PATH=ON
		-DENABLE_WOFF2=$(usex woff2 ON OFF)
		-DENABLE_FONTFORGE_EXTRAS=$(usex extras)
	)

	if use python; then
		python_setup
		mycmakeargs+=( -DPython3_EXECUTABLE="${PYTHON}" )
	fi

	if use truetype-debugger ; then
		mycmakeargs+=( -DENABLE_FREETYPE_DEBUGGER="${EPREFIX}/usr/include/freetype2/internal4fontforge" )
	fi

	cmake_src_configure
}

src_install() {
	cmake_src_install
	docompress -x /usr/share/doc/${PF}/html
	einstalldocs
	find "${ED}" -name '*.la' -type f -delete || die
}
