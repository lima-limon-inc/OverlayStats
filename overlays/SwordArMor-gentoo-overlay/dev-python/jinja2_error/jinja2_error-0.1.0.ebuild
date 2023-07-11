# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Jinja2 Extension for Raise Error"
HOMEPAGE="https://github.com/mumubin/jiaja2_error https://pypi.org/project/jinja2-error/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/arrow[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""
