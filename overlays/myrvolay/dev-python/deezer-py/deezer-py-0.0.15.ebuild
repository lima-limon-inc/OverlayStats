# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit distutils-r1

DESCRIPTION="A wrapper for all Deezer's API"
HOMEPAGE="
	https://pypi.org/project/deezer-py
	https://gitlab.com/RemixDev/deezer-py
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

KEYWORDS="~amd64"
LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
