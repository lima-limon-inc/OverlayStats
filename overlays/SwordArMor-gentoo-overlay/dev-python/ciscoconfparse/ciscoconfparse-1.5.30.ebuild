# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
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
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/dnspython[${PYTHON_USEDEP}]
	dev-python/loguru[${PYTHON_USEDEP}]
	dev-python/passlib[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""
