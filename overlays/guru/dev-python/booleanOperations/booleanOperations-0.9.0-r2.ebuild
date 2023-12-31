# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..11} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Boolean operations on paths"
HOMEPAGE="
	https://pypi.org/project/booleanoperations/
	https://github.com/typemytype/booleanOperations
"
SRC_URI="$(pypi_sdist_url --no-normalize ${PN} ${PV} .zip)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/fonttools-4.0.2[${PYTHON_USEDEP}]
	>=dev-python/pyclipper-1.1.0_p1[${PYTHON_USEDEP}]
"
BDEPEND="
	app-arch/unzip
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/defcon[${PYTHON_USEDEP}]
		dev-python/fontPens[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
