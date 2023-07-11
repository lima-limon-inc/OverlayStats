# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1 pypi

MY_PN=${PN//-/.}

DESCRIPTION="client for 20c's RESTful API"
HOMEPAGE="https://pypi.org/project/twentyc.rpc/
https://github.com/20c/twentyc.rpc"
SRC_URI="$(pypi_sdist_url --no-normalize)"
S=${WORKDIR}/${P^}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-python/requests-2.10.0[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${MY_PN}-${PV}"
