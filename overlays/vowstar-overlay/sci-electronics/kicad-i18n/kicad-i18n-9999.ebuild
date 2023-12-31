# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Electronic Schematic and PCB design tools GUI translations"
HOMEPAGE="https://gitlab.com/kicad/code/kicad-i18n"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://gitlab.com/kicad/code/${PN}.git"
	inherit autotools git-r3
else
	SRC_URI="https://gitlab.com/kicad/code/${PN}/-/archive/${PV}/${P}.tar.bz2"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="CC-BY-SA-4.0"
SLOT="0"

BDEPEND="sys-devel/gettext"
RDEPEND=">=sci-electronics/kicad-5.1.9"
