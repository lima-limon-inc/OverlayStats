# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/warner/python-spake2.git"
else
	MY_PN="python-${PN}"
	MY_P="${MY_PN}-${PV}"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="https://github.com/warner/python-spake2/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Python implementation of SPAKE2"
HOMEPAGE="https://github.com/warner/python-spake2"
LICENSE="MIT"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND=""
RDEPEND="dev-python/hkdf[${PYTHON_USEDEP}]"
BDEPEND=""

python_test() {
	"${EPYTHON}" setup.py speed || die
}
