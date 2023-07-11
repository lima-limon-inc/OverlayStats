# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ppizarror/pygame-menu.git"
else
	SRC_URI="https://github.com/ppizarror/pygame-menu/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A pygame library for menus and GUIs"
HOMEPAGE="https://pygame-menu.readthedocs.io/"
LICENSE="MIT"
SLOT="0"
RESTRICT="test" # Tests require a display device

DEPEND=""
RDEPEND="
	${DEPEND}
	>=dev-python/pygame-1.9.3[${PYTHON_USEDEP}]
	dev-python/pyperclip[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
BDEPEND=""
