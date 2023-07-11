# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A munin plugin to graph some usage and performance stats"
HOMEPAGE="https://www.tummy.com/blogs/2009/12/10/munin-plugins-for-powerdns-recursor/"
SRC_URI="http://ftp.tummy.com/pub/tummy/${PN}/${P}.tar.bz2"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-analyzer/munin"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dodoc CHANGELOG

	exeinto /usr/libexec/munin/plugins
	doexe pdns_rec_*
}
