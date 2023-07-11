# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="PeeringDB python client"
HOMEPAGE="https://peeringdb.github.io/peeringdb-py/
https://github.com/peeringdb/peeringdb-py"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-python/confu-1[${PYTHON_USEDEP}]
	>=dev-python/munge-1.2.0[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/tomlkit[${PYTHON_USEDEP}]
	>=dev-python/twentyc-rpc-1.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""
