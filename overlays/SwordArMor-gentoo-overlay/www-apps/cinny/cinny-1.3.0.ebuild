# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit webapp

DESCRIPTION="Yet another matrix client"
HOMEPAGE="https://cinny.in/ https://github.com/ajbura/cinny/"
MY_GITHUB_AUTHOR="ajbura"
SRC_URI="https://github.com/${MY_GITHUB_AUTHOR}/${PN}/releases/download/v${PV}/${PN}-v${PV}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	unpack ${A}
	mv dist "${P}"
}

src_install() {
	webapp_src_preinst

	insinto "${MY_HTDOCSDIR}/"
	doins -r .

	webapp_src_install
}
