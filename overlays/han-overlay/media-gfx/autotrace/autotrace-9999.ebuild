# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools git-r3

DESCRIPTION="A program for converting bitmaps to vector graphics"
HOMEPAGE="http://autotrace.sourceforge.net/"
EGIT_REPO_URI="https://github.com/autotrace/autotrace.git"

LICENSE="GPL-2+ LGPL-2.1+"
SLOT="0"
IUSE="imagemagick +png pstoedit static-libs"

BDEPEND="
	dev-util/intltool
	virtual/pkgconfig
"
DEPEND="
	dev-libs/glib:2
	png? ( >=media-libs/libpng-1.0.6:0= )
	pstoedit? ( >=media-gfx/pstoedit-3.50 )
	imagemagick? (
		>=media-gfx/imagemagick-6.6.2.5
		<media-gfx/imagemagick-7
	)
"
RDEPEND="${DEPEND}"

DOCS=( AUTHORS ChangeLog NEWS README.md )

src_prepare() {
	default
	sed -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' -i configure.ac || die #468496
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable static-libs static) \
		$(use_with imagemagick magick) \
		$(use_with png) \
		$(use_with pstoedit)
}

src_install() {
	default
	find "${ED}" -name '*.la' -delete || die
}
