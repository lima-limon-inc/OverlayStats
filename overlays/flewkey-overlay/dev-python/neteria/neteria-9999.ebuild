# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ShadowBlip/Neteria.git"
else
	MY_PN="Neteria"
	MY_PV="e1f36e7d66bb86e54a620314f7b7352d3aca621a"
	MY_P="${MY_PN}-${MY_PV}"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="https://github.com/ShadowBlip/Neteria/archive/${MY_PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Open source game networking framework for Python"
HOMEPAGE="https://github.com/ShadowBlip/Neteria"
LICENSE="GPL-2"
SLOT="0"
RESTRICT="test"

DEPEND=""
RDEPEND="dev-python/rsa[${PYTHON_USEDEP}]"
BDEPEND=""
