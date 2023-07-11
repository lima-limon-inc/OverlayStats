# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="GraphQL for Python"
HOMEPAGE="https://github.com/graphql-python/graphql-core"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-describe[${PYTHON_USEDEP}]
		dev-python/pytest-benchmark[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)
"
RDEPEND="
	>=dev-python/Rx-1.6[${PYTHON_USEDEP}]
	<dev-python/Rx-2
"

distutils_enable_tests pytest
distutils_enable_sphinx docs dev-python/sphinx_rtd_theme
