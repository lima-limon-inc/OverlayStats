# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..11} pypy3 )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Distributed object middleware for Python (RPC)"
HOMEPAGE="
	https://pyro5.readthedocs.io
	https://pypi.org/project/Pyro5/
	https://github.com/irmen/Pyro5
"
SRC_URI="$(pypi_sdist_url --no-normalize "${PN^}" "${PV}")"
S=${WORKDIR}/${P^}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	>=dev-python/serpent-1.40[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
distutils_enable_sphinx docs/source \
	dev-python/sphinx-rtd-theme

PROPERTIES="test_network"
RESTRICT="test"
