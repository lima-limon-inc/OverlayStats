# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit distutils-r1

DESCRIPTION="A Unity asset extractor for Python based on AssetStudio"
HOMEPAGE="
		https://pypi.org/project/UnityPy
		https://github.com/K0lb3/UnityPy
"

# Upstream capitalisation for package name
MY_PN="UnityPy"
MY_P="${MY_PN}-${PV}"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/K0lb3/UnityPy.git"
	inherit git-r3
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${MY_P}"
fi

LICENSE="MIT"
SLOT="0"

DEPEND="
	app-arch/brotli[python,${PYTHON_USEDEP}]
	dev-python/lz4[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/tabulate[${PYTHON_USEDEP}]
	dev-python/texture2ddecoder[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
