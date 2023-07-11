# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Factorio is a game in which you build and maintain factories"
HOMEPAGE="https://www.factorio.com/"
SRC_URI="https://www.factorio.com/get-download/${PV}/headless/linux64 -> ${P}.tar.xz"
LICENSE="Factorio"
SLOT="${PV%.*}"
KEYWORDS="amd64"

DEPEND="
	acct-group/factorio
	acct-user/factorio
"

RESTRICT="bindist mirror"

S="${WORKDIR}/factorio"

src_install() {
	insinto "/opt/factorio-${SLOT}"
	doins -r *
	exeinto "/opt/factorio-${SLOT}"/bin/x64
	doexe bin/x64/factorio

	newinitd "${FILESDIR}"/factorio.initd "factorio-${SLOT}"
	newconfd "${FILESDIR}"/factorio.confd "factorio-${SLOT}"

	sed -i "s/%SLOT%/${SLOT}/" "${D}/etc/conf.d/factorio-${SLOT}" || \
		die "SLOTing sed failed"
}

pkg_postinst() {
	einfo "As factorio user, copy data/server-settings.example.json to"
	einfo "config/server-settings.json and data/server-whitelist.example.json"
	einfo "to config/server-whitelist.json and adapt it according to your needs."
	einfo ""
	einfo "Then, run bin/x64/factorio --create ./saves/my-save.zip to create a"
	einfo "new map, and start the service."
}
