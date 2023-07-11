# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Quotes from OpenBSD founder Theo de Raadt"
HOMEPAGE="http://www.openbsd.org/cgi-bin/cvsweb/src/usr.bin/mg/theo.c"
SRC_URI="http://homepage.boetes.org/software/mg/mg-${PV}.tar.gz"
S="${WORKDIR}/mg-${PV}"
LICENSE="BSD fairuse"
SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="games-misc/fortune-mod"
RDEPEND="${BDEPEND}"

src_prepare() {
	eapply_user
	sed -e '1,/talk.*{/d;/^}/,$d;s/^[ \t]*"\(.*\)",\?[ \t]*$/\1\n%/' theo.c | fold -s -w 70 > theo-de-raadt || die
}

src_configure() { :; }

src_compile() {
	strfile theo-de-raadt || die
}

src_install() {
	insinto /usr/share/fortune
	doins theo-de-raadt{,.dat}
}
