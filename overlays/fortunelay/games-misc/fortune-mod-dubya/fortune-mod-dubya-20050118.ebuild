# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Quotes from George W. Bush"
HOMEPAGE="https://web.archive.org/web/20051211013223/http://seiler.us/wiki/index.php/Dubya"
SRC_URI=""
S="${WORKDIR}"
LICENSE="fairuse"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~m68k ~mips ~ppc64 ~amd64-linux ~x86-linux ~ppc-macos ~x86-solaris"

RDEPEND="games-misc/fortune-mod"

src_prepare() {
	cp "${FILESDIR}/dubya-${PV}" dubya || die
	eapply_user
}

src_compile() {
	strfile dubya || die
}

src_install() {
	insinto /usr/share/fortune
	doins dubya dubya.dat
}
