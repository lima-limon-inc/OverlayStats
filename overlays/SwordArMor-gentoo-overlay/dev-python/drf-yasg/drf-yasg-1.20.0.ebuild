# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{3..11} )
inherit distutils-r1

DESCRIPTION="Automated generation of real Swagger schemas from Django code"
HOMEPAGE="
	https://pypi.org/project/drf-yasg/
	https://github.com/axnsan12/drf-yasg/
"
SRC_URI="https://github.com/axnsan12/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="validation"

RDEPEND="
	>=dev-python/coreapi-2.3.3[${PYTHON_USEDEP}]
	>=dev-python/coreschema-0.0.4[${PYTHON_USEDEP}]
	>=dev-python/ruamel-yaml-0.15.34[${PYTHON_USEDEP}]
	>=dev-python/inflection-0.3.1[${PYTHON_USEDEP}]
	>=dev-python/uritemplate-3.0.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/djangorestframework-3.10.3[${PYTHON_USEDEP}]
	>=dev-python/django-2.2.16[${PYTHON_USEDEP}]
	validation? (
		>=dev-python/swagger_spec_validator-2.1.0[${PYTHON_USEDEP}]
	)
"
BDEPEND=""
