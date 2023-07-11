# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1 pypi

DESCRIPTION="Relay library for graphql-core-next"
HOMEPAGE="https://github.com/graphql-python/graphql-relay-py"
SRC_URI="$(pypi_sdist_url --no-normalize)"
S=${WORKDIR}/${P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/graphql-core[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-describe[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
