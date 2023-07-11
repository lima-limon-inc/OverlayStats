# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Path manipulation functions"
HOMEPAGE="https://github.com/ECP-VeloC/spath"
SRC_URI="https://github.com/ECP-VeloC/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+mpi slurm test"

RDEPEND="mpi? ( virtual/mpi )"
DEPEND="
	${RDEPEND}
	test? ( slurm? ( sys-cluster/slurm ) )
"

PATCHES=( "${FILESDIR}/${PN}-0.1.0-no-static.patch" )
RESTRICT="test" # tests require an MPI setup
REQUIRED_USE="test? ( mpi )"

src_configure() {
	local vrm="NONE"
	use slurm && vrm="SLURM"
	export "VELOC_RESOURCE_MANAGER=${vrm}"

	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=ON
		-DSPATH_LINK_STATIC=OFF
		-DTVDISPLAY=OFF

		-DENABLE_TESTS=$(usex test)
		-DMPI=$(usex mpi)
	)
	cmake_src_configure
}
