# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Zen comedy from Steven Wright"
HOMEPAGE="http://www.catb.org/~esr/fortunes"
SRC_URI="http://www.catb.org/~esr/fortunes/stephen-wright"
S="${WORKDIR}"
LICENSE="fairuse"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~mips ~x86"

BDEPEND="games-misc/fortune-mod"
RDEPEND="games-misc/fortune-mod"

src_unpack() {
	cp "${DISTDIR}/stephen-wright" "${S}/steven-wright"
}

src_prepare() {
	sed -i 's:Stephen:Steven:' steven-wright || die
	eapply_user
}

src_compile() {
	strfile steven-wright || die "strfile failed"
}

src_install() {
	insinto /usr/share/fortune
	doins steven-wright steven-wright.dat
}
