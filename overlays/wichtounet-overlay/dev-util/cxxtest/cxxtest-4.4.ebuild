# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

DESCRIPTION="CxxTest is a JUnit/CppUnit/xUnit-like unit testing framework for C++"
HOMEPAGE="http://cxxtest.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="examples doc"

RDEPEND="dev-lang/perl"

src_install() {
	dobin bin/cxxtestgen

	insinto /usr/include/cxxtest
	doins cxxtest/*

	dodoc README Versions COPYING

	use doc && dodoc -r doc
	use examples && dodoc -r sample
}
