# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Pluggable search for Django"
HOMEPAGE="https://haystacksearch.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=dev-python/django-2.2[${PYTHON_USEDEP}]"

# tests have too many dependencies to maintain
RESTRICT="test"

distutils_enable_sphinx docs --no-autodoc
