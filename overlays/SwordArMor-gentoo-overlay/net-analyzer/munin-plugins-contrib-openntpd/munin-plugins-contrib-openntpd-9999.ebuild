# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="openntpd plugin for munin"
HOMEPAGE="https://github.com/munin-monitoring/contrib/tree/master/plugins/openntpd"
EGIT_REPO_URI="https://github.com/munin-monitoring/contrib.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-lang/perl
	net-analyzer/munin
	net-misc/ntp[openntpd]
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	true
}

src_install() {
	insinto /usr/libexec/munin/plugins/openntpd/
	insopts -m0755
	doins plugins/openntpd/*
}
