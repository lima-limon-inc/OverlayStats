# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{10,11} )

inherit distutils-r1

DESCRIPTION="Logging as Storytelling"
HOMEPAGE="https://github.com/ScatterHQ/eliot"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc systemd test"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/testtools[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		)"
RDEPEND="
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
	dev-python/pyrsistent[${PYTHON_USEDEP}]
	systemd? ( dev-python/cffi[${PYTHON_USEDEP}] )
	"

python_compile_all() {
	emake -C "${S}/docs" man
	use doc && emake -C "${S}/docs" html
}

python_install_all() {
	doman "docs/build/man/${PN}.1"
	use doc && DOCS="docs/build/html" einstalldocs
	distutils-r1_python_install_all
}

python_test() {
	py.test || die "Tests fail with ${EPYTHON}"
}
