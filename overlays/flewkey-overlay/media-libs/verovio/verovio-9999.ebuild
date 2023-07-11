# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/rism-digital/verovio/archive/refs/tags/version-${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/verovio-version-${PV}"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rism-digital/verovio.git"
fi

DESCRIPTION="Music engraving library"
HOMEPAGE="https://www.verovio.org/"
LICENSE="LGPL-3"
SLOT="0"
IUSE="darms pae abc musicxml humdrum"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_USE_DIR="${S}/cmake"

src_prepare() {
	test ${PV} != 9999 && sed -i 's/$(git describe --abbrev=7 --always --dirty)/'${PV}'/' "${S}/tools/get_git_commit.sh"
	sed -i "s;/usr/local/bin;$(get_libdir);" "${S}/cmake/CMakeLists.txt"
	cmake_src_prepare
}

src_configure() {
	# TODO: Submit upstream PR to allow building of multiple versions at once
	local mycmakeargs=(
		"-DBUILD_AS_LIBRARY=ON"
		"-DNO_DARMS_SUPPORT=$(usex darms OFF ON)"
		"-DNO_PAE_SUPPORT=$(usex pae OFF ON)"
		"-DNO_ABC_SUPPORT=$(usex abc OFF ON)"
		"-DNO_MUSICXML_SUPPORT=$(usex musicxml OFF ON)"
		"-DNO_MXL_SUPPORT=$(usex musicxml OFF ON)"
		"-DNO_HUMDRUM_SUPPORT=$(usex humdrum OFF ON)"
	)
	cmake_src_configure
}
