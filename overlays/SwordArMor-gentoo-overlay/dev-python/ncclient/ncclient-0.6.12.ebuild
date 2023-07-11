# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="Python library for NETCONF clients"
HOMEPAGE="https://pypi.org/project/ncclient/
https://github.com/ncclient/ncclient"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-python/setuptools-0.6[${PYTHON_USEDEP}]
	>=dev-python/paramiko-1.7[${PYTHON_USEDEP}]
	>=dev-python/lxml-3.3.0[${PYTHON_USEDEP}]
	dev-libs/libxml2
	dev-libs/libxslt
"
RDEPEND="${DEPEND}"
BDEPEND=""
