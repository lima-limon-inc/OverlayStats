# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

DESCRIPTION="Enumerate IP addresses on the local network adapters"
HOMEPAGE="https://github.com/pydron/ifaddr/ https://pypi.org/project/ifaddr/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
IUSE="test"
RESTRICT="!test? ( test )"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

distutils_enable_tests pytest
