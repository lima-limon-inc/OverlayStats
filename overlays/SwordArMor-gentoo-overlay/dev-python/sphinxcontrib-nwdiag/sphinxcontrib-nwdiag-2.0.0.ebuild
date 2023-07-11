# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..11} pypy3 )
inherit distutils-r1

DESCRIPTION="A sphinx extension for embedding network related diagrams using nwdiag."
HOMEPAGE="https://github.com/blockdiag/sphinxcontrib-nwdiag"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/nwdiag"
RDEPEND="
	${DEPEND}
	dev-python/sphinx[${PYTHON_USEDEP}]
"
BDEPEND=""

python_install_all() {
	distutils-r1_python_install_all
	find "${ED}" -name '*.pth' -delete || die
}
