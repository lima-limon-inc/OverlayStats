# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Python bindings for Dublin Traceroute"
HOMEPAGE="https://dublin-traceroute.net
https://github.com/insomniacslk/python-dublin-traceroute"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="analysis"

DEPEND=""
RDEPEND="
	${DEPEND}
	analysis? (
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
	)
	dev-python/tabulate
	dev-python/pygraphviz
"
BDEPEND="
	~net-analyzer/dublin-traceroute-${PV}
	dev-libs/jsoncpp
	net-libs/libpcap
	net-libs/libtins
"

python_prepare_all() {
	# do not depend on deprecated dep
	sed -i -e '/pytest_runner/d' setup.py || die

	distutils-r1_python_prepare_all
}
