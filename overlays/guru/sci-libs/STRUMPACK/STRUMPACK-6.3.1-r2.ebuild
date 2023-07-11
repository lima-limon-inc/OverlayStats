# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake flag-o-matic fortran-2

DESCRIPTION="Structured Matrix Package (LBNL)"
HOMEPAGE="https://github.com/pghysels/STRUMPACK"
SRC_URI="https://github.com/pghysels/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

KEYWORDS="~amd64"
LICENSE="BSD"
SLOT="0"
IUSE="+butterflypack combblas count-flops +hip message-counter metis +mpi +openmp +scotch papi task-timers +zfp" # +cuda +slate +ptscotch +magma matlab

RDEPEND="
	butterflypack? ( sci-libs/ButterflyPACK	)
	combblas? ( sci-libs/CombBLAS )
	hip? (
		dev-util/hip:=
		sci-libs/hipBLAS:=
		sci-libs/rocBLAS:=
		sci-libs/rocSOLVER:=
	)
	metis? ( sci-libs/parmetis )
	mpi? (
		sci-libs/scalapack
		virtual/mpi
	)
	papi? ( dev-libs/papi )
	scotch? ( sci-libs/scotch:= )
	zfp? ( dev-libs/zfp )

	sci-libs/metis
	virtual/blas
	virtual/lapack
"
#	magma? ( sci-libs/magma )
DEPEND="${RDEPEND}"

REQUIRED_USE="
	butterflypack? ( mpi )
	combblas? ( mpi )
	metis? ( mpi )
"
# ?? ( cuda hip )
# ptscotch? ( mpi )
# slate? ( mpi )
# magma? ( cuda )
DOCS=( README.md CHANGELOG SUPPORT )
PATCHES=( "${FILESDIR}/${P}-multilib-was-not-respected.patch" )

src_configure() {
	use combblas && append-cppflags '-I/usr/include/CombBLAS'
	local mycmakeargs=(
		-DTPL_ENABLE_MAGMA=NO
		-DTPL_ENABLE_PTSCOTCH=NO
		-DTPL_ENABLE_SLATE=NO

		-DSTRUMPACK_COUNT_FLOPS=$(usex count-flops)
		-DSTRUMPACK_MESSAGE_COUNTER=$(usex message-counter)
		-DSTRUMPACK_TASK_TIMERS=$(usex task-timers)
		-DSTRUMPACK_USE_HIP=$(usex hip)
		-DSTRUMPACK_USE_MPI=$(usex mpi)
		-DSTRUMPACK_USE_OPENMP=$(usex openmp)
		-DTPL_ENABLE_BPACK=$(usex butterflypack)
		-DTPL_ENABLE_COMBBLAS=$(usex combblas)
		-DTPL_ENABLE_PAPI=$(usex papi)
		-DTPL_ENABLE_PARMETIS=$(usex metis)
		-DTPL_ENABLE_SCOTCH=$(usex scotch)
		-DTPL_ENABLE_ZFP=$(usex zfp)
	)
	if use hip; then
		addpredict /dev/kfd
		mycmakeargs+=( "-DHIP_ROOT_DIR=${EPREFIX}/usr" )
	fi
	use scotch && mycmakeargs+=( "-DSCOTCH_INCLUDE_DIR=${EPREFIX}/usr/include/scotch" )
	cmake_src_configure
}
