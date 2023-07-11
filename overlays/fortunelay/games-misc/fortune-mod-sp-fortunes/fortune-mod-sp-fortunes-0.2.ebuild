# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="South Park Fortunes"
HOMEPAGE="https://web.archive.org/web/20080313231434/http://eol.init1.nl/content/view/44/54/"
SRC_URI=""
S="${WORKDIR}"
LICENSE="GPL-2 fairuse"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~m68k ~mips ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-solaris"

RDEPEND="games-misc/fortune-mod"
BDEPEND="${RDEPEND}"

src_prepare() {
	cp "${FILESDIR}/SP-${PV}" SP || die
	eapply_user
}

src_compile() {
	strfile SP || die
}

src_install() {
	insinto /usr/share/fortune
	doins SP SP.dat
}
