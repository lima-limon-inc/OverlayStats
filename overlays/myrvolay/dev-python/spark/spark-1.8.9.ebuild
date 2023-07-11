# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit distutils-r1

DESCRIPTION="An Earley-Algorithm context-free grammar parser toolkit"
HOMEPAGE="
		https://pypi.org/project/spark-parser
		https://github.com/rocky/python-spark
"

# Package name on PyPI
MY_PN="spark_parser"
MY_P="${MY_PN}-${PV}"

SRC_URI="mirror://pypi/${PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

S="${WORKDIR}/${MY_P}"

KEYWORDS="~amd64"
LICENSE="GPL-2"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
