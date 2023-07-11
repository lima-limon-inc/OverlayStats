# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/magic-wormhole/magic-wormhole.git"
else
	SRC_URI="https://github.com/magic-wormhole/magic-wormhole/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Safe, simple file sharing"
HOMEPAGE="https://github.com/magic-wormhole/magic-wormhole"
LICENSE="MIT"
SLOT="0"
RESTRICT="test" # Requires magic-wormhole-mailbox-server

DEPEND=""
RDEPEND="
	>=dev-python/spake2-0.8[${PYTHON_USEDEP}]
	dev-python/pynacl[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	>=dev-python/attrs-19.2.0[${PYTHON_USEDEP}]
	>=dev-python/twisted-22.4.0-r2[${PYTHON_USEDEP},ssl]
	>=dev-python/autobahn-0.14.1[${PYTHON_USEDEP}]
	dev-python/automat[${PYTHON_USEDEP}]
	dev-python/hkdf[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/humanize[${PYTHON_USEDEP}]
	>=dev-python/txtorcon-18.0.2[${PYTHON_USEDEP}]
"
BDEPEND=""
