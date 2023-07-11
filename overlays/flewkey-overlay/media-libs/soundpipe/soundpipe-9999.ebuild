# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3
EGIT_REPO_URI="https://git.sr.ht/~pbatch/soundpipe"

DESCRIPTION="A lightweight music DSP library"
HOMEPAGE="https://pbat.ch/proj/soundpipe.html"
LICENSE="MIT"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i 's/\/usr\/local\//$(DESTDIR)$(PREFIX)\//g' "${S}/Makefile"
	sed -i 's/\/lib/\/$(LIBDIR)/g' "${S}/Makefile"
}

src_install() {
	dodir /usr/include
	dodir "/usr/$(get_libdir)"
	emake DESTDIR="${D}" PREFIX="/usr" LIBDIR="$(get_libdir)" install
}
