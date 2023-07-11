# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="${PN^}"
MY_PV="${PV/./}"

inherit font

DESCRIPTION="Mojikyo Character Map"
HOMEPAGE="https://archive.org/details/MojikyoCmap400ALL49TTF.7z"
SRC_URI="https://archive.org/download/${MY_PN}Cmap${MY_PV}ALL49TTF.7z/${MY_PN}Cmap${MY_PV}%2BALL49TTF.7z"

LICENSE="mojikyo"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="app-arch/p7zip"

S="${WORKDIR}/${MY_PN}Cmap${MY_PV}+ALL49TTF/"

FONT_S="${S}/TTF_ALL49"
FONT_SUFFIX="TTF"

src_install() {
	font_src_install
	docinto html
	dodoc -r HELP/.
	docompress -x "/usr/share/doc/${PF}/html"
}
