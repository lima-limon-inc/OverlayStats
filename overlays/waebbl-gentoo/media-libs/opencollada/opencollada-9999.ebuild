# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake edos2unix flag-o-matic

DESCRIPTION="Stream based read/write library for COLLADA files"
HOMEPAGE="http://www.opencollada.org/"

if [[ ${PV} = *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/KhronosGroup/OpenCOLLADA.git"
else
	SRC_URI="https://github.com/KhronosGroup/OpenCOLLADA/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"
	S="${WORKDIR}/OpenCOLLADA-${PV}"
fi

LICENSE="MIT"
SLOT="0"
IUSE="static-libs"

RDEPEND="
	dev-libs/libpcre
	dev-libs/libxml2
	dev-libs/zziplib:=
	media-libs/lib3ds
	sys-libs/zlib
"
DEPEND="${RDEPEND}"
BDEPEND="
	app-admin/chrpath
	virtual/pkgconfig
"

PATCHES=(
	"${FILESDIR}/${PN}-1.6.62-cmake-fixes.patch"
	"${FILESDIR}/${PN}-1.6.63-pcre-fix.patch"
)

src_prepare() {
	edos2unix CMakeLists.txt

	cmake_src_prepare

	# Remove bundled depends that have portage equivalents
	einfo "Dropping bundles libraries"
	rm -r Externals/{expat,lib3ds,LibXML,pcre,zziplib} || die

	# Remove unused build systems
	einfo "Removing unused scripts"
	rm Makefile scripts/{unixbuild.sh,vcproj2cmake.rb} || die
	find "${S}" -name SConscript -delete || die
}

src_configure() {
	# bug 619670
	append-cxxflags -std=c++14

	local mycmakeargs=(
		-DUSE_SHARED=ON
		-DUSE_STATIC=$(usex static-libs)
		-DUSE_LIBXML=ON
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install

	newenvd - 99opencollada <<- _EOF_
		LDPATH=/usr/$(get_libdir)/opencollada
	_EOF_

	# Remove insecure DAEValidator RUNPATH and install DAEValidator library
	dolib.so "${BUILD_DIR}/lib/libDAEValidatorLibrary.so"
	chrpath -d "${BUILD_DIR}/bin/DAEValidator" || die

	dobin "${BUILD_DIR}/bin/DAEValidator"
	dobin "${BUILD_DIR}/bin/OpenCOLLADAValidator"
	# Need to be in same directory as above binaries
	docinto "/usr/bin"
	dodoc "${BUILD_DIR}/bin/COLLADAPhysX3Schema.xsd"
	dodoc "${BUILD_DIR}/bin/collada_schema_1_4_1.xsd"
	dodoc "${BUILD_DIR}/bin/collada_schema_1_5.xsd"
}
