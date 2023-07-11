# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/bastibe/python-soundfile.git"
	EGIT_SUBMODULES=()
else
	MY_PN="python-soundfile"
	MY_P="${MY_PN}-${PV}"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="https://github.com/bastibe/python-soundfile/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="An audio library for Python"
HOMEPAGE="https://python-soundfile.readthedocs.io/"
LICENSE="BSD"
SLOT="0"

DEPEND="
	dev-python/cffi[${PYTHON_USEDEP}]
	media-libs/libsndfile
"
RDEPEND="
	${DEPEND}
	dev-python/numpy[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest
