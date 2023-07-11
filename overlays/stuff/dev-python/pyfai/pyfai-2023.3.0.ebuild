# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=meson-python
PYTHON_COMPAT=( python3_{7..11} )

inherit distutils-r1

DESCRIPTION="Libary for azimuthal integration of 2D diffraction data"
HOMEPAGE="https://pyfai.readthedocs.io"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc python"

RDEPEND="
	dev-python/h5py[${PYTHON_USEDEP}]
	dev-python/PyQt5[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/fabio[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/pyopencl[${PYTHON_USEDEP}]
	dev-python/silx[${PYTHON_USEDEP}]
	dev-python/numexpr[${PYTHON_USEDEP}]
	sci-libs/fftw:3.0
"

BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
"

DEPEND="${BDEPEND}
	${RDEPEND}
	doc? ( dev-util/gtk-doc )
"


REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

src_prepare() {
	sed -i 's:setuptools<60.0.0:setuptools>60.0.0:' "${WORK}"setup.py || die "Sed failed!"
	sed -i 's:setuptools< 60.0.0:setuptools> 60.0.0:' "${WORK}"setup.py || die "Sed failed!"
	default
}

python_compile_all() {
	export SETUPTOOLS_PRETEND_VERSION='59.9.9'
	esetup.py build
}

python_test() {
	esetup.py test
}

python_install_all() {
	distutils-r1_python_install_all
}
