# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1 pypi

DESCRIPTION="Graphene Django integration"
HOMEPAGE="https://pypi.org/project/graphene-django/"
SRC_URI="$(pypi_sdist_url --no-normalize)"
S=${WORKDIR}/${P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	<dev-python/graphene-3
	<dev-python/graphql-core-3
	>=dev-python/django-2.2[${PYTHON_USEDEP}]
	>=dev-python/djangorestframework-3.6.3[${PYTHON_USEDEP}]
	<dev-python/djangorestframework-3.14.0
	>=dev-python/graphene-2.1.9[${PYTHON_USEDEP}]
	>=dev-python/graphql-core-2[${PYTHON_USEDEP}]
	>=dev-python/promise-2.1[${PYTHON_USEDEP}]
	dev-python/text-unidecode[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/${P}-pytest-runner.patch"
)
