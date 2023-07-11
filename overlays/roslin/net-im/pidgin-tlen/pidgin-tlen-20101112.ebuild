# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Tlen.pl support for Pidgin (plugin)"
HOMEPAGE="http://nic.com.pl/~alek/pidgin-tlen"
SRC_URI="mirror://github/pelotasplus/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=net-im/pidgin-2.6.5"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_compile() {
	emake LOCALBASE="/usr" || die "Compile failed"
}

src_install() {
	emake install LOCALBASE="/usr" DESTDIR="${D}" || die "Install failed"
	dodoc README || die "dodoc failed"
}
