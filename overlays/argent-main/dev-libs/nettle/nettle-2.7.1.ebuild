# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils autotools multilib

DESCRIPTION="Low-level cryptographic library"
HOMEPAGE="http://www.lysator.liu.se/~nisse/nettle/"
SRC_URI="http://www.lysator.liu.se/~nisse/archive/${P}.tar.gz"

LICENSE="|| ( LGPL-3 LGPL-2.1 )"
SLOT="0/4" # subslot = libnettle soname version
KEYWORDS="amd64 x86"
IUSE="doc +gmp neon static-libs test"

DEPEND="gmp? ( dev-libs/gmp )"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-2.7-shared.patch

	sed -e '/CFLAGS=/s: -ggdb3::' \
		-e 's/solaris\*)/sunldsolaris*)/' \
		-i configure.ac || die

	# conditionally build tests and examples required by tests
	use test || sed -i '/SUBDIRS/s/testsuite examples//' Makefile.in || die

	eautoreconf
}

src_configure() {
	# --disable-openssl bug #427526
	econf \
		--libdir="${EPREFIX}"/usr/$(get_libdir) \
		$(use_enable gmp public-key) \
		$(use_enable static-libs static) \
		--disable-openssl \
		$(use_enable doc documentation) \
		$(use_enable neon arm-neon)
}

src_install() {
	default

	if use doc ; then
		dohtml nettle.html
		dodoc nettle.pdf
	fi
}
