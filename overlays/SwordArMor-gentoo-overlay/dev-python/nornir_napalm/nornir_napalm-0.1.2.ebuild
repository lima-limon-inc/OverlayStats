# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="NAPALM's plugins for nornir"
HOMEPAGE="https://pypi.org/project/nornir-napalm/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-python/napalm[${PYTHON_USEDEP}]
	dev-python/nornir[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""
