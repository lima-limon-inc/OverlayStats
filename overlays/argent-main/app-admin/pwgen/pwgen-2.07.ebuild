# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Password Generator"
HOMEPAGE="http://sourceforge.net/projects/pwgen/"
SRC_URI="mirror://sourceforge/pwgen/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="livecd"

src_prepare() {
	epatch "${FILESDIR}"/2.06-special-char.patch
}

src_configure() {
	econf --sysconfdir="${EPREFIX}"/etc/pwgen
}

src_install() {
	default
	use livecd && newinitd "${FILESDIR}"/pwgen.rc pwgen
}