# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/qwertyquerty/pypresence.git"
else
	SRC_URI="https://github.com/qwertyquerty/pypresence/archive/${PV}.tar.gz  -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Discord IPC and Rich Presence wrapper for Python"
HOMEPAGE="https://qwertyquerty.github.io/pypresence/html/index.html"
LICENSE="BSD"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
