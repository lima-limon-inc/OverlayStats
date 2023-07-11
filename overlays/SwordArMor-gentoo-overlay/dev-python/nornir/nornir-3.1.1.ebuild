# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="Pluggable multi-threaded framework with inventory management"
HOMEPAGE="https://pypi.org/project/nornir/
https://github.com/nornir-automation/nornir"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-python/ruamel-yaml-0.16[${PYTHON_USEDEP}]
	<dev-python/ruamel-yaml-0.17[${PYTHON_USEDEP}]
	>=dev-python/mypy_extensions-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.7[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""
