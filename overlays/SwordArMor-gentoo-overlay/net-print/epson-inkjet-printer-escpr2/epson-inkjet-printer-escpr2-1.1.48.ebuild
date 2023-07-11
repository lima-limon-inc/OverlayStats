# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rpm

DESCRIPTION="Epson Inkjet Printer Driver 2 (ESC/P-R) for Linux"
HOMEPAGE="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
SRC_URI="https://download3.ebz.epson.net/dsc/f/03/00/13/52/26/977f2b2c13cc185981479fbd225b802c35c92beb/${P}-1lsb3.2.src.rpm"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	app-text/ghostscript-gpl
	net-print/cups
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	default
	find "${ED}" -name '*.la' -delete || die
}
