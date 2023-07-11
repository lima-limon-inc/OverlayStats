# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/repology/py-libversion.git"
else
	MY_PN="py-${PN}"
	MY_P="${MY_PN}-${PV}"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="https://github.com/repology/${MY_PN}/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Python bindings for libversion"
HOMEPAGE="https://github.com/repology/py-libversion"
LICENSE="MIT"
SLOT="0"

DEPEND="dev-libs/libversion"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

distutils_enable_tests setup.py
