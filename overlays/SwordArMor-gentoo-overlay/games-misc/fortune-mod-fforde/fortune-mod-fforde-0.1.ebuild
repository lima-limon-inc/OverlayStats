# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
MY_P=${PN/-mod/}
DESCRIPTION="Quotes from Jasper Fforde books"
HOMEPAGE="https://www.swordarmor.fr/"
SRC_URI="https://www.swordarmor.fr/documents/${MY_P}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~ppc-macos ~x86-solaris"
IUSE=""
RESTRICT="mirror"

RDEPEND="games-misc/fortune-mod"

S=${WORKDIR}/${MY_P}

src_install() {
	insinto /usr/share/fortune
	doins fforde fforde.dat
}
