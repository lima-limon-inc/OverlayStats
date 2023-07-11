# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_EXT=1
DISTUTILS_USE_SETUPTOOLS=rdepend
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1 xdg-utils eutils optfeature

DESCRIPTION="Core functionality for performing astrophysics with Python"
HOMEPAGE="https://www.astropy.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
#KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc"
#RESTRICT="network-sandbox"
RESTRICT="!test? ( test )"

DEPEND="
	dev-libs/expat:0=
	>=sci-astronomy/erfa-1.4.0:0=
	>=sci-astronomy/wcslib-5.16:0=
	>=sci-libs/cfitsio-3.410:0=
	>=dev-python/jinja-2.7[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.13.0[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}
	dev-python/h5py[${PYTHON_USEDEP}]
	>=dev-python/pytest-3.1[${PYTHON_USEDEP}]
	dev-libs/libxml2[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	sys-libs/zlib:0=
"
BDEPEND="
	~dev-python/astropy-helpers-3.1.1[${PYTHON_USEDEP}]
	>=dev-python/cython-0.21[${PYTHON_USEDEP}]
	virtual/pkgconfig
	doc? (
		${DEPEND}
		media-gfx/graphviz
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP},jpeg(+)]
		sci-libs/scikit-image[${PYTHON_USEDEP}]
		dev-python/sphinx-astropy[${PYTHON_USEDEP}]
	)
	test? (
		${DEPEND}
		dev-python/pytest-astropy[${PYTHON_USEDEP}]
		dev-python/pytest-mpl[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests setup.py

python_prepare_all() {
	export mydistutilsargs=( --offline )
	rm -r ${PN}_helpers || die
	rm -r cextern/{expat,erfa,cfitsio,wcslib} || die
	sed -i -e '/auto_use/s/True/False/' setup.cfg || die
	cat >> setup.cfg <<-EOF

		[build]
		use_system_libraries=1
	EOF
	xdg_environment_reset
	distutils-r1_python_prepare_all
}

python_compile_all() {
	if use doc; then
		VARTEXFONTS="${T}"/fonts MPLCONFIGDIR="${T}" PYTHONPATH="${BUILD_DIR}"/lib \
			esetup.py build_docs
		cp docs/{_static/*,_build/html/_static} || die
		cp docs/{_static/*,_build/html/_images} || die
		HTML_DOCS=( docs/_build/html/. )
	fi
}

pkg_postinst() {
	optfeature "To read Table objects from HTML files"											dev-python/beautifulsoup4
	optfeature "Used to sanitize text when disabling HTML escaping in the Table HTML writer"	dev-python/bleach
	optfeature "To read/write Table objects from/to the Enhanced CSV ASCII table format"		dev-python/pyyaml
	optfeature "To read/write Table objects from/to pandas DataFrame objects"					dev-python/pandas
	optfeature "To specify and convert between timezones"										dev-python/pytz
	optfeature "To retrieve JPL ephemeris of Solar System objects"								dev-python/jplephem
	optfeature "Faster SCEngine indexing engine with Table, although this may still be slower in some cases than the \
default indexing engine."																		dev-python/sortedcontainers
	optfeature "To provide plotting functionality that astropy.visualization enhances"			dev-python/matplotlib
	optfeature "To downsample a data array in astropy.nddata.utils"								sci-libs/scikit-image
	optfeature "Used for the ‘kraft-burrows-nousek’ interval in poisson_conf_interval"			dev-python/mpmath
	optfeature "Used only in tests to test for reference leaks"									dev-python/objgraph
	optfeature "Enables the serialization of various Astropy classes into a portable, hierarchical, human-readable \
representation"																					dev-python/asdf
	optfeature " Improves the performance of sigma-clipping and other functionality that may required computing statistics \
on arrays with NaN values."																		dev-python/bottleneck
	optfeature "Testing the code"																dev-python/pytest-astropy
	optfeature "Used for distributed testing"													dev-python/pytest-xdist
	optfeature "Used for testing with Matplotlib figures"										dev-python/pytest-mpl
	optfeature "Used for testing notebook interface of Table"									dev-python/ipython
	optfeature "Used for code coverage measurements"											dev-python/coverage
#	skyfield: Used for testing Solar System coordinates.
#	optfeature	dev-python/configobj
}