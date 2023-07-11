# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Quotation's by several people (mostly from Slovakia)"
HOMEPAGE="https://github.com/Alessandro-Barbieri/fortunelay"
SRC_URI=""
S="${WORKDIR}"
LICENSE="GPL-2 fairuse"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~m68k ~mips ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-solaris"

RDEPEND="games-misc/fortune-mod"

src_prepare() {
	cp "${FILESDIR}/debilneho-${PV}" debilneho || die
	eapply_user
}

src_compile() {
	strfile debilneho || die
}

src_install() {
	insinto /usr/share/fortune
	doins debilneho debilneho.dat
}
