# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit savedconfig optfeature

DESCRIPTION="a fast, lightweight, vim-like browser based on webkit"
HOMEPAGE="https://fanglingsu.github.io/vimb/"

KEYWORDS="~amd64"
SRC_URI="https://github.com/fanglingsu/vimb/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
IUSE="savedconfig adblock"

DEPEND="
	virtual/pkgconfig
	adblock? ( www-misc/wyebadblock )
"

RDEPEND="
	x11-libs/gtk+:3
	>=net-libs/webkit-gtk-2.20.0:4
"

src_prepare() {
	default
	restore_config config.def.h
}

src_compile() {
	emake V=1 PREFIX="/usr"
}

src_install() {
	emake V=1 PREFIX="/usr" DESTDIR="${D}" install
	save_config src/config.def.h
	use adblock && dosym /usr/lib/wyebrowser/adblock.so /usr/lib/vimb/adblock.so
}

pkg_postinst() {
	optfeature "media decoding support"  media-plugins/gst-plugins-libav media-libs/gst-plugins-good
}
