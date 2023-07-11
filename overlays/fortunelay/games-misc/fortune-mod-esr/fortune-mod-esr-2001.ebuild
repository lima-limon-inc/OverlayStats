# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Eric S.Raymond aphorisms on politics, liberty, and philosophy"
HOMEPAGE="http://www.catb.org/~esr/fortunes"
SRC_URI="http://www.catb.org/~esr/fortunes/esr"
S="${WORKDIR}"
LICENSE="fairuse"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~mips ~x86"

BDEPEND="games-misc/fortune-mod"
RDEPEND="games-misc/fortune-mod"

src_unpack() {
	cp "${DISTDIR}/esr" "${S}/esr" || die
}

src_compile() {
	strfile esr || die "strfile failed"
}

src_install() {
	insinto /usr/share/fortune
	doins esr esr.dat
}
