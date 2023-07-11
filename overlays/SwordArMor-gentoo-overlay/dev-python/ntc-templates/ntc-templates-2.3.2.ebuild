# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="TextFSM Templates for net-devs, and TextFSM's CliTable wrapper"
HOMEPAGE="https://pypi.org/project/ntc-templates/
https://github.com/networktocode/ntc-templates"
MY_PN="${PN/-/_}"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_PN}-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-python/textfsm-1.1.0[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${MY_PN}-${PV}"
