# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )
inherit python-r1

DESCRIPTION="Python script to update mods on a dedicated factorio server"
HOMEPAGE="https://github.com/pdemonaco/factorio-mod-updater"
MY_GITHUB_AUTHOR="pdemonaco"
SRC_URI="https://github.com/${MY_GITHUB_AUTHOR}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="all-rights-reserved"
RESTRICT="bindist mirror"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	${DEPEND}
	dev-python/requests
"
BDEPEND=""

src_install() {
	default
	python_foreach_impl python_newscript mod_updater.py factorio-mod-updater
}
