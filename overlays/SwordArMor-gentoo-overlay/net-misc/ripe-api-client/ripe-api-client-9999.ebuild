# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )
inherit autotools git-r3 python-r1

DESCRIPTION="Update RIPE DB through the API"
HOMEPAGE="https://git.alt.tf/bcollet/ripe-api-client"
EGIT_REPO_URI="https://git.grifon.fr/alarig/${PN}.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="
	dev-python/pathlib2[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	${DEPEND}
"
BDEPEND=""

src_install() {
	dodoc config.yml.dist

	python_foreach_impl python_newscript ripe-api.py ${PN}
}
