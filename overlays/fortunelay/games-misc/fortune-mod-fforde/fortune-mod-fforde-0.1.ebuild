# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_P="${PN/-mod/}"

DESCRIPTION="Quotes from Jasper Fforde books"
HOMEPAGE="https://www.swordarmor.fr"
SRC_URI="https://www.swordarmor.fr/documents/${MY_P}.tgz"
S="${WORKDIR}/${MY_P}"
LICENSE="MIT fairuse"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~ppc-macos ~x86-solaris"

RDEPEND="games-misc/fortune-mod"

src_install() {
	insinto /usr/share/fortune
	doins fforde fforde.dat
}
