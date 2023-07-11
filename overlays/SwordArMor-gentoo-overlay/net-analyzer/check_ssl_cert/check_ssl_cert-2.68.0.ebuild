# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit bash-completion-r1

DESCRIPTION="A shell script to check an SSL/TLS connection"
HOMEPAGE="https://github.com/matteocorti/check_ssl_cert"
SRC_URI="https://github.com/matteocorti/${PN}/releases/download/v${PV}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	app-alternatives/bc
	net-misc/curl
	sys-apps/coreutils
	sys-apps/file
	net-dns/bind-tools
	net-analyzer/nmap
	dev-libs/openssl
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	exeinto "/usr/$(get_libdir)/nagios/plugins"
	doexe ${PN}

	doman ${PN}.1

	newbashcomp ${PN}.completion ${PN}
}
