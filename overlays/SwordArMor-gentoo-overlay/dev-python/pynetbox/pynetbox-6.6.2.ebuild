# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Python API client library for NetBox"
HOMEPAGE="https://github.com/digitalocean/pynetbox"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="
	>=dev-python/requests-2.20.0
	<dev-python/requests-3.0
	dev-python/six
"
RDEPEND="${DEPEND}"
BDEPEND=""

distutils_enable_tests unittest

python_prepare_all() {
	if ! use test; then
		rm -r "${S}/tests"
	fi

	distutils-r1_python_prepare_all
}
