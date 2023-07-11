# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Adapted from the myMPD package's included ebuild

EAPI=7

inherit eutils cmake systemd

MY_PN="myMPD"
S="${WORKDIR}/${MY_PN}-${PV}"

DESCRIPTION="myMPD is a standalone and mobile friendly web-based MPD client."
HOMEPAGE="https://jcorporation.github.io/myMPD"
SRC_URI="https://github.com/jcorporation/${MY_PN}/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE="+flac +id3 java -lua ssl systemd"

BDEPEND="
	>=dev-util/cmake-3.4
	java? ( >=virtual/jre-1.7 )
	dev-lang/perl"

RDEPEND="
	lua? ( >=dev-lang/lua-5.3 )
	ssl? ( >=dev-libs/openssl-1.1 )
	systemd? ( sys-apps/systemd )
	id3? ( media-libs/libid3tag )
	flac? ( media-libs/flac )
	acct-user/mympd
	acct-group/mympd"

QA_PRESTRIPPED="
	usr/bin/mympd
	usr/bin/mympd-config
	usr/bin/mympd-script"

src_compile() {
	default
	export ENABLE_FLAC=$(usex flac "ON" "OFF")
	export ENABLE_LIBID3TAG=$(usex id3 "ON" "OFF")
	export ENABLE_LUA=$(usex lua "ON" "OFF")
	export ENABLE_SSL=$(usex ssl "ON" "OFF")
	./build.sh release || die
}

src_install() {
	cd release
	dobin mympd
	dobin cli_tools/mympd-config
	if use lua; then
		dobin cli_tools/mympd-script
	fi
	newinitd "contrib/initscripts/mympd.openrc" "${PN}"
	if use systemd; then
		systemd_newunit contrib/initscripts/mympd.service mympd.service
	fi
	"${D}/usr/bin/mympd-config" --mympdconf "${D}/etc/mympd.conf"
	dodoc "${S}/README.md"
}

pkg_postinst() {
	elog
	elog "Modify /etc/mympd.conf to suit your needs or use the"
	elog "\`mympd-config\` tool to generate a valid mympd.conf automatically."
	elog
}
