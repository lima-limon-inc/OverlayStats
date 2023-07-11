# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Ping plugin for munin"
HOMEPAGE="https://github.com/munin-monitoring/contrib/tree/master/plugins/ping"
EGIT_REPO_URI="https://github.com/munin-monitoring/contrib.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-lang/perl
	net-analyzer/munin
	net-dns/bind-tools
	net-misc/iputils
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/libexec/munin/plugins/ping/
	insopts -m0755
	doins plugins/ping/*
}
