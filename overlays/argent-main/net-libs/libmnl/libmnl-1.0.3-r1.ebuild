# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils toolchain-funcs

DESCRIPTION="Minimalistic netlink library"
HOMEPAGE="http://netfilter.org/projects/libmnl"
SRC_URI="http://www.netfilter.org/projects/${PN}/files/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="examples static-libs"

src_configure() {
	econf $(use_enable static-libs static)
}

src_install() {
	default
	gen_usr_ldscript -a mnl
	prune_libtool_files

	if use examples; then
		find examples/ -name 'Makefile*' -delete
		dodoc -r examples/
		docompress -x /usr/share/doc/${PF}/examples
	fi
}
