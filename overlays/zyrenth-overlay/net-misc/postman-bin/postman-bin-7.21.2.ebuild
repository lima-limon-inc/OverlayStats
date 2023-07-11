# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop pax-utils xdg

MY_PN="${PN/-bin/}"

DESCRIPTION="Supercharge your API workflow"
HOMEPAGE="https://www.getpostman.com"
SRC_URI="
	amd64? ( https://dl.pstmn.io/download/version/${PV}/linux64 -> ${P}-amd64.tar.gz )
"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror strip"

S="${WORKDIR}/${MY_PN^}/app"

src_prepare() {
	mv _Postman Postman
	default
}

src_install() {
	insinto "/opt/${MY_PN}"
	doins -r *
	exeinto /opt/${MY_PN}
	doexe Postman
	dosym "../../opt/${MY_PN}/Postman" "${ED}/usr/bin/${MY_PN}"
	newicon -s 128 resources/app/assets/icon.png ${MY_PN}.png
	make_desktop_entry "postman" \
		"Postman" \
		 "postman" \
		 "DevelopmentIDE;" \
		 "Comment=Build, test, and document your APIs faster"
	use pax_kernel && pax-mark m "${ED}/opt/${MY_PN}/${MY_PN^}"
}
