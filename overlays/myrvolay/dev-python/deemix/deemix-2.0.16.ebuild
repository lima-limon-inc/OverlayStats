# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit distutils-r1

DESCRIPTION="A barebone Deezer downloader library"
HOMEPAGE="
		https://pypi.org/project/deemix
		https://git.freezer.life/RemixDev/deemix-py
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

KEYWORDS="~amd64"
LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/deezer-py[${PYTHON_USEDEP}]
	dev-python/eventlet[${PYTHON_USEDEP}]
	dev-python/pycryptodome[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/spotipy[${PYTHON_USEDEP}]
	media-libs/mutagen[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
