# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/matham/ffpyplayer.git"
else
	SRC_URI="https://github.com/matham/ffpyplayer/archive/v${PV}.tar.gz  -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Python bindings for the FFmpeg media player"
HOMEPAGE="https://matham.github.io/ffpyplayer/"
LICENSE="LGPL-3"
SLOT="0"

DEPEND="
	media-video/ffmpeg[postproc]
	media-libs/libsdl2
	media-libs/sdl2-mixer
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

distutils_enable_tests setup.py
