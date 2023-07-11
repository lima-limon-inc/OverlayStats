# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Python CFFI binding to libolm"
HOMEPAGE="https://gitlab.matrix.org/matrix-org/olm/"
SRC_URI="https://gitlab.matrix.org/matrix-org/olm/-/archive/${PV}/olm-${PV}.tar.bz2 -> ${P}.tar.bz2"
KEYWORDS="~amd64"
SLOT="0"
LICENSE="Apache-2.0"

S="${WORKDIR}/olm-${PV}/python"

CDEPEND="
	>=dev-libs/olm-${PV}
"

RDEPEND="
	>=dev-python/cffi-1.0.0[${PYTHON_USEDEP}]
	dev-python/future
	${CDEPEND}
"

DEPEND="
	${CDEPEND}
	test? (
		${RDEPEND}
		dev-python/pytest
		dev-python/pytest-flake8
		dev-python/pytest-isort
		dev-python/pytest-cov
		dev-python/pytest-benchmark
		dev-python/aspectlib
	)
"

distutils_enable_tests pytest
