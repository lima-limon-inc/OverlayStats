# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="${PN/mod-/}"

DESCRIPTION="The best phrases of Linux.Org.Ru members"
HOMEPAGE="http://lorquotes.ru"
SRC_URI="http://lorquotes.ru/fortraw.php"
S="${WORKDIR}"
LICENSE="WTFPL-2 fairuse"
SLOT="0"
KEYWORDS="~amd64 ~arm ~amd64-linux ~x86-linux"

RDEPEND="games-misc/fortune-mod"
BDEPEND="
	${RDEPEND}
	virtual/libiconv
"

src_prepare(){
	iconv -f koi8r -t utf8 "${DISTDIR}/fortraw.php" > "${WORKDIR}/${PN}" || die
	eapply_user
}

src_compile() {
	strfile "${WORKDIR}/${PN}" || die
}

src_install() {
	insinto /usr/share/fortune
	doins "${PN}" "${PN}.dat"
}
