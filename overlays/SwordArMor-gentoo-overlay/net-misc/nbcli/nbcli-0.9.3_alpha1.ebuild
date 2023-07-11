# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

MY_P="${P/_alpha/.dev}"

DESCRIPTION="Extensible command-line interface for Netbox"
HOMEPAGE="
https://github.com/ericgeldmacher/nbcli
https://codeberg.org/nbcli/nbcli
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="
	>=dev-python/pynetbox-6.6.0
	<dev-python/pynetbox-7
	dev-python/pyyaml
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${MY_P}"

python_prepare_all() {
	if ! use test; then
		rm -r "${S}/tests"
	fi

	distutils-r1_python_prepare_all
}
