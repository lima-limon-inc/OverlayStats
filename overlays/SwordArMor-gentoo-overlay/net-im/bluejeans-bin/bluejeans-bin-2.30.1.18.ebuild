# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rpm xdg

DESCRIPTION="Verizon video conferencing system"
HOMEPAGE="https://www.bluejeans.com/"
MY_PN="BlueJeans"
SRC_URI="https://swdl.bluejeans.com/desktop-app/linux/$(ver_cut 1-3)/${MY_PN}_${PV}.rpm"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install() {
	cp -a "${S}/"* "${D}/" || die "Install failed!"
}
