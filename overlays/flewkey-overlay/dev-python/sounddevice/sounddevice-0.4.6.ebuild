# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/spatialaudio/python-sounddevice.git"
	EGIT_SUBMODULES=()
else
	MY_PN="python-sounddevice"
	MY_P="${MY_PN}-${PV}"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="https://github.com/spatialaudio/python-sounddevice/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="PortAudio bindings for Python"
HOMEPAGE="https://python-sounddevice.readthedocs.io/"
LICENSE="MIT"
SLOT="0"
RESTRICT="test"

DEPEND="
	dev-python/cffi[${PYTHON_USEDEP}]
	media-libs/portaudio
"
RDEPEND="${DEPEND}"
BDEPEND=""
