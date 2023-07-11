# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..12} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/meejah/txtorcon.git"
else
	SRC_URI="https://github.com/meejah/txtorcon/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Tor control protocol implementation for Python"
HOMEPAGE="https://github.com/meejah/txtorcon"
LICENSE="MIT"
SLOT="0"

DEPEND=""
RDEPEND="
	>=dev-python/twisted-22.4.0-r2[${PYTHON_USEDEP},ssl]
	>=dev-python/zope-interface-3.6.1[${PYTHON_USEDEP}]
	dev-python/incremental[${PYTHON_USEDEP}]
	dev-python/automat[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		sys-process/lsof
	)
"

distutils_enable_tests pytest
