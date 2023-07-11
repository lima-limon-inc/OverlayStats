# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/dofuuz/python-soxr.git"
	EGIT_SUBMODULES=()
else
	MY_PN="python-soxr"
	MY_P="${MY_PN}-${PV}"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="https://github.com/dofuuz/python-soxr/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Resampling library for Python"
HOMEPAGE="https://github.com/dofuuz/python-soxr"
LICENSE="LGPL-2.1"
SLOT="0"

DEPEND="media-libs/soxr"
RDEPEND="
	${DEPEND}
	dev-python/numpy[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"

src_configure() {
	DISTUTILS_ARGS=( --use-system-libsoxr )
}

python_prepare_all() {
	# https://github.com/cython/cython/issues/3783
	sed -i 's/const datatype_t/datatype_t/g' "${S}/src/soxr/cysoxr.pyx"
	distutils-r1_python_prepare_all
}

python_compile() {
	SETUPTOOLS_SCM_PRETEND_VERSION="${PV}" distutils-r1_python_compile
}

distutils_enable_tests pytest
