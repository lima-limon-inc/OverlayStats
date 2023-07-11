# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_10)

inherit distutils-r1

DESCRIPTION="Client library for ActivityWatch"
HOMEPAGE="https://activitywatch.net"
LICENSE="MPL-2.0"

COMMIT="f7a8dbb3f81be81224368970054fd33d2814c9d7"
SRC_URI="https://github.com/ActivityWatch/${PN}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

KEYWORDS="~amd64"
SLOT="0"
# Test tries to connect to aw-server
RESTRICT="test"

S="${WORKDIR}/${PN}-${COMMIT}"

RDEPEND="
	app-misc/aw-core[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/persist-queue[${PYTHON_USEDEP}]
	dev-python/tabulate[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"

DEPEND="
	${RDEPEND}
"
