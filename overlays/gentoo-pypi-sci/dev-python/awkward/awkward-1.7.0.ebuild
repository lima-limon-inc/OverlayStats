# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="Manipulate JSON-like data with NumPy-like idioms."
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://github.com/scikit-hep/awkward-1.0"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.13.1[${PYTHON_USEDEP}]"
distutils_enable_tests pytest
