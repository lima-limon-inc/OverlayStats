# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Quotes from Dr. Strangelove"
HOMEPAGE="https://web.archive.org/web/20051221051158/http://seiler.us/wiki/index.php/Strangelove"
SRC_URI=""
S="${WORKDIR}"
LICENSE="fairuse"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~m68k ~mips ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-solaris"

RDEPEND="games-misc/fortune-mod"
BDEPEND="${RDEPEND}"

src_prepare() {
	cp "${FILESDIR}/strangelove-${PV}" strangelove || die
	eapply_user
}

src_compile() {
	strfile strangelove || die
}

src_install() {
	insinto /usr/share/fortune
	doins strangelove strangelove.dat
}
