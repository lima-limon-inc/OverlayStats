# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Quotes on liberty, mostly from the Founding Fathers of the United States"
HOMEPAGE="http://www.catb.org/~esr/fortunes"
SRC_URI="http://www.catb.org/~esr/fortunes/liberty"
S="${WORKDIR}"
LICENSE="fairuse"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~mips ~x86"

BDEPEND="games-misc/fortune-mod"
RDEPEND="games-misc/fortune-mod"

src_unpack() {
	cp "${DISTDIR}/liberty" "${S}/liberty" || die
}

src_compile() {
	strfile liberty || die "strfile failed"
}

src_install() {
	insinto /usr/share/fortune
	doins liberty liberty.dat
}
