# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson git-r3
EGIT_REPO_URI="https://git.sr.ht/~emersion/libscfg"

DESCRIPTION="C library for the scfg configuration format"
HOMEPAGE="https://git.sr.ht/~emersion/libscfg"
LICENSE="MIT"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	meson_src_install
	# I don't know how to make meson install the header file
	dodir /usr/include
	cp "${S}/include/scfg.h" "${D}/usr/include/scfg.h"
}
