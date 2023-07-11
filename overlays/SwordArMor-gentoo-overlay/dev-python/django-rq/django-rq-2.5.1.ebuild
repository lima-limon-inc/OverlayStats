# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="A simple app that provides django integration for RQ (Redis Queue)"
HOMEPAGE="https://github.com/rq/django-rq/"
SRC_URI="https://github.com/rq/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-python/django-2.0[${PYTHON_USEDEP}]
	>=dev-python/rq-1.2[${PYTHON_USEDEP}]
	>=dev-python/redis-3[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""
