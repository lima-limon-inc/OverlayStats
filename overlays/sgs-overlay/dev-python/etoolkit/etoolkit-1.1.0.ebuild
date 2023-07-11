# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="A simple toolkit for setting environment variables in a flexible way"
HOMEPAGE="https://github.com/blackm0re/etoolkit"
MY_PN="etoolkit"
MY_P="${MY_PN}-${PV}"

SRC_URI="mirror://pypi/${MY_P:0:1}/${MY_PN}/${MY_P}.tar.gz"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-3+"
SLOT="0"

RDEPEND="
	>=dev-python/cryptography-3.2.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest

python_test() {
	epytest -s
}

python_install_all() {
	distutils-r1_python_install_all
}
