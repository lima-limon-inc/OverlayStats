# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/wiseman/py-webrtcvad.git"
	EGIT_SUBMODULES=()
else
	MY_PN="py-webrtcvad"
	MY_P="${MY_PN}-${PV}"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="https://github.com/wiseman/py-webrtcvad/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Python interface to the WebRTC Voice Activity Detector"
HOMEPAGE="https://github.com/wiseman/py-webrtcvad"
LICENSE="MIT"
SLOT="0"
RESTRICT="test"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
