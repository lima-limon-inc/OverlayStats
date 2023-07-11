# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Tuxemon/Tuxemon.git"
else
	MY_PN="Tuxemon"
	MY_P="${MY_PN}-${PV}"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="https://github.com/Tuxemon/Tuxemon/archive/v${PV}.tar.gz  -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Open source monster-fighting RPG"
HOMEPAGE="https://www.tuxemon.org/"
LICENSE="GPL-3"
SLOT="0"
IUSE="+rumble"
RESTRICT="test"

DEPEND="dev-python/Babel"
RDEPEND="
	${DEPEND}
	dev-python/cbor[${PYTHON_USEDEP}]
	dev-python/natsort[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/prompt-toolkit[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.9.1[${PYTHON_USEDEP}]
	>=dev-python/pygame-2.1.2[${PYTHON_USEDEP}]
	>=dev-python/pygame-menu-4.2.8[${PYTHON_USEDEP}]
	>=dev-python/pytmx-3.31[${PYTHON_USEDEP}]
	>=dev-python/pyscroll-2.30[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/neteria[${PYTHON_USEDEP}]
	rumble? ( dev-libs/libshake )
"
BDEPEND=""

src_prepare() {
	sed -i "s/\/user\/share/\/usr\/share/" "${S}/tuxemon/constants/paths.py"
	distutils-r1_src_prepare
}

src_install() {
	distutils-r1_src_install
	dodir /usr/share/tuxemon
	cp -r "${S}/mods" "${D}/usr/share/tuxemon"
}

#distutils_enable_tests unittest
