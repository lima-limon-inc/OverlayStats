# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Network Automation and Programmability Abstraction Layer"
HOMEPAGE="https://pypi.org/project/napalm/
https://github.com/napalm-automation/napalm"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-python/setuptools-38.4.0[${PYTHON_USEDEP}]
	>=dev-python/cffi-1.11.3[${PYTHON_USEDEP}]
	>=dev-python/paramiko-2.6.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.7.0[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]
	dev-python/textfsm[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/netaddr[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/pyeapi[${PYTHON_USEDEP}]
	dev-python/netmiko[${PYTHON_USEDEP}]
	>=dev-python/junos-eznc-2.2.1[${PYTHON_USEDEP}]
	dev-python/ciscoconfparse[${PYTHON_USEDEP}]
	dev-python/scp[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.3.0[${PYTHON_USEDEP}]
	dev-python/ncclient[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""
