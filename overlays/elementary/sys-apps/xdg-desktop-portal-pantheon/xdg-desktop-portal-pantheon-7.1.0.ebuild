# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson vala

DESCRIPTION="Pantheon XDG Desktop Portals"
HOMEPAGE="https://github.com/elementary/portals"
SRC_URI="https://github.com/elementary/portals/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE="systemd"

DEPEND="
	dev-libs/granite:0
	gui-libs/libhandy:1
	x11-libs/gtk+:3
	x11-libs/vte:2.91"
RDEPEND="${DEPEND}
	systemd? ( sys-apps/systemd )"
BDEPEND=""

S="${WORKDIR}/portals-${PV}"

src_prepare() {
	eapply_user
	use systemd || eapply "${FILESDIR}/${PN}-7.0.0.patch"
	vala_setup
}

