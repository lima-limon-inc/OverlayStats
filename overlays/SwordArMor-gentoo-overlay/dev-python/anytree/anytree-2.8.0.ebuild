# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Powerful and Lightweight Python Tree Data Structure"
HOMEPAGE="https://github.com/c0fec0de/anytree/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=dev-python/six-1.9.0"
RDEPEND="${DEPEND}"
BDEPEND=""

python_install_all() {
	distutils-r1_python_install_all
	rm "${ED}"/usr/LICENSE || die 'Can’t remove LICENSE file'
}
