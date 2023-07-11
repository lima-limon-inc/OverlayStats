# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Fortune database for Woody Allen quotes (in Italian)"
HOMEPAGE="http://somemixedstuff.blogspot.com/2007/04/set-of-fortunes-of-woody-allen-quotes.html"
SRC_URI="https://github.com/daviderestivo/fortune-mod-woody-allen-it/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${P}"
LICENSE="GPL-3 fairuse"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-solaris"

RDEPEND="games-misc/fortune-mod"

src_install() {
	dodoc README.md
	cd files || die
	insinto /usr/share/fortune
	doins "${PN}" "${PN}".dat

}
