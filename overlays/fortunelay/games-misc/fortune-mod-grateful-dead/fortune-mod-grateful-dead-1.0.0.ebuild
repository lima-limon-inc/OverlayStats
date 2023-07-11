# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="grateful_dead_lyrics"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Fortune modules from the Grateful Gead song lyrics"
HOMEPAGE="https://gitlab.com/xgqt/grateful_dead_lyrics"
SRC_URI="https://gitlab.com/xgqt/${MY_PN}/-/archive/${PV}/${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"
KEYWORDS="~amd64"
LICENSE="GPL-3 fairuse"
SLOT="0"

BDEPEND="
	games-misc/fortune-mod
"
RDEPEND="
	${BDEPEND}
"
