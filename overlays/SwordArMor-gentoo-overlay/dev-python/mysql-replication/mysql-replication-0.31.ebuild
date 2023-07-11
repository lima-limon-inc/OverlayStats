# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} pypy )
inherit distutils-r1

DESCRIPTION="Pure Python Implementation of MySQL replication protocol"
HOMEPAGE="
	https://pypi.org/project/mysql-replication/
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/pymysql[${PYTHON_USEDEP}]
"
