# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

MY_PV="${PV/_p/b}"

DESCRIPTION="A tool for authoring Sphinx themes with a simple (opinionated) workflow."
HOMEPAGE="
	https://pypi.org/project/sphinx-theme-builder/
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${PN}-${MY_PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/pyproject-metadata[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	dev-python/tomli[${PYTHON_USEDEP}]
	dev-python/nodeenv[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/flit_core-3.2[${PYTHON_USEDEP}]
	<dev-python/flit_core-4[${PYTHON_USEDEP}]
"

S="${WORKDIR}/${PN}-${MY_PV}"

distutils_enable_tests pytest
