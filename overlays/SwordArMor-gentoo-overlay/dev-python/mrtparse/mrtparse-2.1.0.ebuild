# Copyright 2019-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9,10} pypy{,3} )
inherit distutils-r1

DESCRIPTION="MRT format data parser"
HOMEPAGE="https://github.com/t2mune/mrtparse"
SRC_URI="https://github.com/t2mune/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
