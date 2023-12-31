# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1

DESCRIPTION="A dict with attribute-style access"
HOMEPAGE="https://github.com/bcj/AttrDict"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		>=dev-python/nose-1.0[${PYTHON_USEDEP}]
	)
"
RDEPEND="dev-python/six[${PYTHON_USEDEP}]"

DOCS="README.rst"

PATCHES=( "${FILESDIR}/attrdict-collections.diff" )

python_test() {
	esetup.py nosetests
}
