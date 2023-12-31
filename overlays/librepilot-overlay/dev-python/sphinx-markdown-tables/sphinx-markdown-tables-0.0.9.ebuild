# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} pypy3 )

inherit distutils-r1

DESCRIPTION="Sphinx extension which add table handling to recommonmark"

HOMEPAGE="
        https://www.sphinx-doc.org/
		https://github.com/ryanfox/sphinx-markdown-tables/
        https://pypi.org/project/sphinx-markdown-tables/
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~loong ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x64-solaris"

PDEPEND="
        >=dev-python/sphinx-2.0[${PYTHON_USEDEP}]
"
BDEPEND="
        test? ( ${PDEPEND} )
"

distutils_enable_tests pytest

python_compile() {
        distutils-r1_python_compile
        find "${BUILD_DIR}" -name '*.pth' -delete || die
}

python_test() {
        cd "${T}" || die
        epytest "${S}"/tests
}


