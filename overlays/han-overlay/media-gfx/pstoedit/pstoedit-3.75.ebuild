# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Translate PostScript and PDF graphics into other vector formats"
HOMEPAGE="https://sourceforge.net/projects/pstoedit/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="emf imagemagick plotutils pptx static-libs"

BDEPEND="virtual/pkgconfig"
DEPEND="
	media-libs/libpng:0=
	>=app-text/ghostscript-gpl-8.71-r1
	emf? ( >=media-libs/libemf-1.0.3 )
	imagemagick? ( >=media-gfx/imagemagick-6.6.1.2:=[cxx] )
	plotutils? ( media-libs/plotutils )
	pptx? ( dev-libs/libzip )
"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${PN}"-3.75-libdl.patch )

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable static-libs static) \
		$(use_with emf) \
		$(use_with imagemagick magick) \
		$(use_with plotutils libplot) \
		$(use_with pptx) \
		--without-swf
}

src_install() {
	default
	find "${ED}" -name '*.la' -delete
}
