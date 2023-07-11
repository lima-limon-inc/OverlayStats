# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

MY_PN="${PN/-/.}"

DESCRIPTION="Command line interface to Gandi.net products using the public API"
HOMEPAGE="https://cli.gandi.net/"
SRC_URI="https://github.com/Gandi/${MY_PN}/archive/refs/tags/${PV}.tar.gz -> ${MY_PN}-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/openssl
	dev-python/IPy[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-vcs/git
	net-misc/openssh
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${MY_PN}-${PV}"

src_prepare() {
	# strip rdep specific to namespaces
	sed -i -e "s/'setuptools',//" setup.py || die
	distutils-r1_src_prepare
}

python_compile() {
	distutils-r1_python_compile
	rm "${BUILD_DIR}/install$(python_get_sitedir)"/lib/__init__.py
	find "${BUILD_DIR}" -name '*.pth' -delete || die
}

python_install() {
	rm "${BUILD_DIR}"/lib/gandi/__init__.py || die
	distutils-r1_python_install
}

python_install_all() {
	distutils-r1_python_install_all
	find "${D}" -name '*.pth' -delete || die
}
