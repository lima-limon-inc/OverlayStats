# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Advanced network calculator and address planning helper"
HOMEPAGE="https://pypi.org/project/netcalc/
https://github.com/israel-lugo/netcalc"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-python/netaddr-0.7.12[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""
