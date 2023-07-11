# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake fcaps

DESCRIPTION="NAT-aware multipath tracerouting tool"
HOMEPAGE="https://dublin-traceroute.net/"
MY_GITHUB_AUTHOR="insomniacslk"
SRC_URI="https://github.com/${MY_GITHUB_AUTHOR}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="caps"

DEPEND="caps? ( sys-libs/libcap )"
RDEPEND="
	${DEPEND}
	net-libs/libpcap
"
BDEPEND="
	dev-libs/jsoncpp
	net-libs/libtins
"

pkg_postinst() {
	fcaps cap_net_raw+ep usr/bin/dublin-traceroute

	einfo ""
	einfo "In order to generate nice output (instead of a JSON), you may want"
	einfo "to install dev-python/dublin-traceroute and run"
	einfo "'python -m dublintraceroute plot trace.json' after dublin-traceroute"
	einfo ""
}
