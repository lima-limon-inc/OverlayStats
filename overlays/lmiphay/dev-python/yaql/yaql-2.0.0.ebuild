# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_11)

inherit distutils-r1 pypi

DESCRIPTION="An embeddable and extensible query language"
HOMEPAGE="https://yaql.readthedocs.io/en/latest/"
SRC_URI="$(pypi_sdist_url yaql)"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/Babel-1.3.0
	<dev-python/pbr-2.0.0
	>=dev-python/python-dateutil-2.4.2
	>=dev-python/six-1.9.0
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.rst"
