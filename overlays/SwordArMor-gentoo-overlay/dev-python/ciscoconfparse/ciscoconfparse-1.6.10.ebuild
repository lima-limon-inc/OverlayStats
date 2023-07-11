# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_SETUPTOOLS=no
PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Parse, audit, query, build, and modify Cisco IOS-style configurations"
HOMEPAGE="http://www.pennington.net/py/ciscoconfparse/
https://github.com/mpenning/ciscoconfparse"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-python/dnspython-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/ipaddr-2.1.11[${PYTHON_USEDEP}]
	>=dev-python/loguru-0.5.3[${PYTHON_USEDEP}]
	>=dev-python/passlib-1.7.4[${PYTHON_USEDEP}]
	>=dev-python/toml-0.10.2[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""

distutils_enable_tests pytest
