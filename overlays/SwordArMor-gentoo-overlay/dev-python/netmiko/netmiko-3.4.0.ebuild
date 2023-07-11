# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Multivendor library to simplify Paramiko SSH connections to netdev"
HOMEPAGE="https://pypi.org/project/netmiko/ https://github.com/ktbyers/netmiko"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-python/setuptools-38.4.0[${PYTHON_USEDEP}]
	>=dev-python/paramiko-2.6.0[${PYTHON_USEDEP}]
	>=dev-python/scp-0.13.2[${PYTHON_USEDEP}]
	dev-python/tenacity[${PYTHON_USEDEP}]
	>=dev-python/textfsm-1.1.2[${PYTHON_USEDEP}]
	>=dev-python/ntc-templates-2.0.0[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""
