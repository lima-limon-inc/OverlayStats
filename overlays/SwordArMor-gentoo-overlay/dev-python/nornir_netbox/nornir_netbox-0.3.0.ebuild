# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Pluggable multi-threaded framework with inventory management"
HOMEPAGE="https://pypi.org/project/nornir/
https://github.com/nornir-automation/nornir"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-python/requests-2.23.0[${PYTHON_USEDEP}]
	>=dev-python/nornir-3[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""
