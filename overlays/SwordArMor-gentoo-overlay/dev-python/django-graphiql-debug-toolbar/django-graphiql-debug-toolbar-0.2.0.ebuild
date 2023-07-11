# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Django Debug Toolbar for GraphiQL IDE"
HOMEPAGE="https://pypi.org/project/django-graphiql-debug-toolbar/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-python/django-2.2[${PYTHON_USEDEP}]
	>=dev-python/graphene-django-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/django-debug-toolbar-3.1[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""
