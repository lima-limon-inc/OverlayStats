# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10,11} )
inherit distutils-r1

DESCRIPTION="click plugin to show the command tree of your CLI"
HOMEPAGE="https://pypi.org/project/click-command-tree/"
SRC_URI="https://github.com/whwright/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/click
"
BDEPEND=""
DEPEND="${RDEPEND}"

distutils_enable_tests unittest
