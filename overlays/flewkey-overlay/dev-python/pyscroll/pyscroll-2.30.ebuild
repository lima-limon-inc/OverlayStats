# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..12} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/bitcraft/pyscroll.git"
else
	MY_PV="6ddbface62a6aa90f3cc373416fdb9724a85056a"
	MY_P="${PN}-${MY_PV}"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="https://github.com/bitcraft/pyscroll/archive/${MY_PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Animated scrolling maps for Pygame"
HOMEPAGE="https://github.com/bitcraft/pyscroll"
LICENSE="LGPL-3"
SLOT="0"
RESTRICT="test"

DEPEND=""
RDEPEND="dev-python/pygame"
BDEPEND=""
