# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Python Client for eAPI"
HOMEPAGE="https://pypi.org/project/pyeapi/
https://github.com/arista-eosplus/pyeapi"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	doc? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	dev-python/netaddr[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/${P}-doc-napoleon.patch"
)

distutils_enable_sphinx docs
