# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV=$(ver_cut 1-3)post$(ver_cut 5)
MY_P=${PN}-${MY_PV}

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1

DESCRIPTION="Tools for accessing JPEG2000 files"
HOMEPAGE="https://glymur.readthedocs.org"
SRC_URI="https://github.com/quintusdias/glymur/archive/refs/tags/v${MY_PV}.tar.gz -> ${MY_P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
"
BDEPEND="test? (
		sci-libs/gdal[python]
		sci-libs/scikit-image[${PYTHON_USEDEP}]
		media-libs/openjpeg:2
	)
"

S="${WORKDIR}/${MY_P}"

distutils_enable_tests pytest
distutils_enable_sphinx docs/source dev-python/numpydoc dev-python/sphinx-rtd-theme

EPYTEST_DESELECT=(
	# requires the 'imagecodecs'
	tests/test_tiff2jp2.py::TestSuite::test_rgba_interface_big_endian
	tests/test_tiff2jp2.py::TestSuite::test_rgba_interface_big_endian_stripped
	tests/test_tiff2jp2.py::TestSuite::test_rgba_interface_big_endian_tiled
)

python_prepare_all() {
	use doc && { mkdir docs/source/_static || die ; }
	distutils-r1_python_prepare_all
}