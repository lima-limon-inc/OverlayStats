# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils autotools toolchain-funcs

DESCRIPTION="netcat clone with better IPv6 support, improved code, etc..."
HOMEPAGE="http://netcat6.sourceforge.net/"
SRC_URI="ftp://ftp.deepspace6.net/pub/ds6/sources/nc6/nc6-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="ipv6 nls bluetooth"

# need to block netcat as we provide the "nc" file now too
DEPEND="
	bluetooth? ( net-wireless/bluez )
"
RDEPEND="
	${DEPEND}
	!net-analyzer/netcat
"

S=${WORKDIR}/nc6-${PV}

DOCS=( AUTHORS BUGS README NEWS TODO CREDITS ChangeLog )

src_prepare() {
	epatch \
		"${FILESDIR}"/${P}-unix-sockets.patch \
		"${FILESDIR}"/${P}-automake-1.14.patch
	AM_OPTS="--force-missing" eautoreconf
}

src_configure() {
	econf \
		$(use_enable ipv6) \
		$(use_enable bluetooth bluez) \
		$(use_enable nls)
}

src_compile() {
	emake AR=$(tc-getAR)
}

src_install() {
	default
	dodir /usr/bin
	dosym /usr/bin/nc6 /usr/bin/nc
}
