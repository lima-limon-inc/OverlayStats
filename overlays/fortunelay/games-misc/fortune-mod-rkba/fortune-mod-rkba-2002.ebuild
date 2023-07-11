# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Quotes on firearms, the Second Amendment, and the right to keep and bear arms"
HOMEPAGE="http://www.catb.org/~esr/fortunes"
SRC_URI="http://www.catb.org/~esr/fortunes/rkba"
S="${WORKDIR}"
LICENSE="fairuse"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~mips ~x86"

BDEPEND="games-misc/fortune-mod"
RDEPEND="games-misc/fortune-mod"

src_unpack() {
	cp "${DISTDIR}/rkba" "${S}/rkba" || die
}

src_compile() {
	strfile rkba || die "strfile failed"
}

src_install() {
	insinto /usr/share/fortune
	doins rkba rkba.dat
}
