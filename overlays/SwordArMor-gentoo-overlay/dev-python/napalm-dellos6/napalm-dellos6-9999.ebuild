# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1 git-r3

DESCRIPTION="NAPALM Driver for Dell EMC OS6 Enterprise"
HOMEPAGE="https://github.com/ggiesen/napalm-dellos6"
EGIT_REPO_URI="https://github.com/ggiesen/napalm-dellos6.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-python/napalm-2.0.0[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""
