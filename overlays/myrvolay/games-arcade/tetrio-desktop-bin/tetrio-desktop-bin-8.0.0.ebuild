# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# TODO: Perhaps use the .deb directly for the icons and desktop file
# See there for dependencies too
# Still perfectly functional for now

MY_PN=${PN/-bin/}

inherit xdg desktop pax-utils

DESCRIPTION="TETR.IO desktop client"
HOMEPAGE="https://tetr.io"
SRC_URI="https://tetr.io/about/desktop/builds/TETR.IO%20Setup.tar.gz -> ${P}.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${MY_PN}-${PV}"

src_install() {
	insinto /opt/${MY_PN}
	doins -r *
	fperms +x "/opt/${MY_PN}/${MY_PN}"
	dosym ../../opt/${MY_PN}/${MY_PN} usr/bin/${MY_PN}
	pax-mark -m "${ED}"/opt/${MY_PN}/${MY_PN}

	# Icons taken from the .deb
	newicon -s 256 "${FILESDIR}/icon-256px.png" tetrio-desktop.png
	newicon -s 512 "${FILESDIR}/icon-256px.png" tetrio-desktop.png

	make_desktop_entry "tetrio-desktop" "TETR.IO Desktop" "tetrio-desktop" "Game;"
}
