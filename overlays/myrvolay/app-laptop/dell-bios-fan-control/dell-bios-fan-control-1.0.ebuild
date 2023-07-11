# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd

DESCRIPTION="Utility to control BIOS fan control on some Dell laptops"
HOMEPAGE="https://github.com/TomFreudenberg/dell-bios-fan-control"

# Use commit of specific version
GIT_COMMIT="a2c81a2918b15b97bdb1c6bf41233e4c2786d416"
SRC_URI="https://github.com/TomFreudenberg/dell-bios-fan-control/archive/${GIT_COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${GIT_COMMIT}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="${RDEPEND}"

src_install() {
	dobin dell-bios-fan-control
	dodoc README.md
	systemd_dounit "${FILESDIR}/dell-bios-fan-control.service"
}

pkg_postinst() {
	ewarn "Turning off BIOS fan control could result in permanent hardware damage!"
	ewarn "Make sure you have a fan control solution properly set up beforehand"
	ewarn "such as the suggested app-laptop/i8kutils"
}
