# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_{10,11})

inherit distutils-r1

DESCRIPTION="Lightweight Python module to discover and control WeMo devices"
HOMEPAGE="https://github.com/pavoni/pywemo"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
RESTRICT="mirror"

LICENSE="BSD MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep 'dev-python/typing[${PYTHON_USEDEP}]' python2_7)
"
DEPEND="
	dev-python/ifaddr[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.rst"
