# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit distutils-r1

DESCRIPTION="A Python wrapper for Perfare's Texture2DDecoder"
HOMEPAGE="
		https://pypi.org/project/texture2ddecoder
		https://github.com/K0lb3/texture2ddecoder
"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/K0lb3/texture2ddecoder.git"
	inherit git-r3
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

src_prepare() {
	default

	# Adding -fpermissive to the extra_compile_args array
	# Compilation may fail if it is not enabled
	sed -i 's/"-std=c++11"/& , "-fpermissive"/' setup.py
}
