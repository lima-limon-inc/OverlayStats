# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Junos 'EZ' automation for non-programmers"
HOMEPAGE="https://pypi.org/project/junos-eznc/
http://www.github.com/Juniper/py-junos-eznc"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-python/lxml-3.2.4[${PYTHON_USEDEP}]
	~dev-python/ncclient-0.6.13[${PYTHON_USEDEP}]
	>=dev-python/paramiko-1.15.2[${PYTHON_USEDEP}]
	>=dev-python/scp-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.7.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	dev-python/netaddr[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/yamlordereddictloader[${PYTHON_USEDEP}]
	dev-python/pyparsing[${PYTHON_USEDEP}]
	dev-python/transitions[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""

python_install_all() {
	distutils-r1_python_install_all
	find "${D}" -name '*.pth' -delete || die
}
