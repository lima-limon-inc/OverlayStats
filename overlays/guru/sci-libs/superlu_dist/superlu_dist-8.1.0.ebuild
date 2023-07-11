# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DOCS_BUILDER="doxygen"
DOCS_CONFIG_NAME="DoxyConfig"
FORTRAN_NEEDED="fortran"

inherit cmake docs fortran-2

DESCRIPTION="MPI distributed sparse LU factorization library"
HOMEPAGE="
	https://portal.nersc.gov/project/sparse/superlu/
	https://github.com/xiaoyeli/superlu_dist
"
SRC_URI="https://github.com/xiaoyeli/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="combblas +complex-precision +double-precision examples hip lapack fortran metis single-precision test"
# TODO: cuda

RDEPEND="
	sci-libs/colamd
	virtual/blas
	virtual/mpi

	combblas? ( sci-libs/CombBLAS )
	hip? (
		sci-libs/hipBLAS
		sci-libs/rocBLAS
		sci-libs/rocSOLVER
	)
	lapack? ( virtual/lapack )
	metis? ( sci-libs/parmetis )
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

PATCHES=(
	"${FILESDIR}/${PN}-8.0.0_p20220526-system-colamd.patch"
	"${FILESDIR}/${PN}-8.0.0_p20220526-fortran.patch"
)
RESTRICT="test" # tests require an MPI setup

src_prepare() {
	rm -r CBLAS || die
	rm SRC/colamd.{c,h} || die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-Denable_openmp=ON
		-DBUILD_SHARED_LIBS=ON
		-DBUILD_STATIC_LIBS=OFF
		-DTPL_ENABLE_CUDALIB=OFF
		-DTPL_ENABLE_INTERNAL_BLASLIB=OFF

		-Denable_complex16=$(usex complex-precision)
		-Denable_double=$(usex double-precision)
		-Denable_examples=$(usex examples ON OFF)
		-Denable_single=$(usex single-precision)
		-Denable_tests=$(usex test ON OFF)
		-DTPL_ENABLE_COMBBLASLIB=$(usex combblas)
		-DTPL_ENABLE_HIPLIB=$(usex hip)
		-DTPL_ENABLE_LAPACKLIB=$(usex lapack)
		-DTPL_ENABLE_PARMETISLIB=$(usex metis)
		-DXSDK_ENABLE_Fortran=$(usex fortran)
	)
	if use combblas; then
		mycmakeargs+=(
			-DTPL_COMBBLAS_LIBRARIES="${EPREFIX}/usr/$(get_libdir)/libCombBLAS.so"
			-DTPL_COMBBLAS_INCLUDE_DIRS="${EPREFIX}/usr/include/CombBLAS/"
		)
	fi
	if use metis; then
		mycmakeargs+=(
			-DTPL_PARMETIS_LIBRARIES="${EPREFIX}/usr/$(get_libdir)/libparmetis.so"
			-DTPL_PARMETIS_INCLUDE_DIRS="${EPREFIX}/usr/include"
		)
	fi
	cmake_src_configure
}
