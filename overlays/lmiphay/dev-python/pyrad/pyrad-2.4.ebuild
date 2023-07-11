# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_11)

inherit eutils distutils-r1

DESCRIPTION="Python RADIUS implementation"
HOMEPAGE="https://github.com/wichert/pyrad"
SRC_URI="https://github.com/pyradius/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/netaddr
	dev-python/six
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.rst"

src_install() {
	dodoc ${DOCS}
	distutils-r1_src_install
}
