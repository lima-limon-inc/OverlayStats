# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Quotes from Homer Simpson"
HOMEPAGE="https://web.archive.org/web/20061008155830/http://www.cs.indiana.edu:80/~crcarter/homer/homer.html"
SRC_URI="https://web.archive.org/web/20061008155830/http://www.cs.indiana.edu:80/~crcarter/homer/fortune-homer.tar.gz"
S="${WORKDIR}/${PN/mod-/}"
LICENSE="GPL-2 fairuse"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~m68k ~mips ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-solaris"

RDEPEND="games-misc/fortune-mod"

src_unpack() {
	tar -xf "${DISTDIR}/fortune-homer.tar.gz" || die
}

src_install() {
	insinto /usr/share/fortune
	doins homer homer.dat
	dodoc README
}
