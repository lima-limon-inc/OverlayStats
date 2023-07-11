# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Configuration file validation and generation"
HOMEPAGE="https://pypi.org/project/confu/
https://github.com/20c/confu"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )"
BDEPEND=""

python_test() {
	pytest -vv || die "Tests fail with ${EPYTHON}"
}

src_install() {
	rm_tests() {
		use test || rm -r "${S}-${EPYTHON//\./_}/lib/tests"
	}
	python_foreach_impl rm_tests
	use test || rm -r "${S}/tests"

	distutils-r1_src_install
}
