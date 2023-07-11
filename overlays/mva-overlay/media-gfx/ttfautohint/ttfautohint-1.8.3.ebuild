# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A library to autohint TrueType fonts"
HOMEPAGE="http://www.freetype.org/ttfautohint/"
SRC_URI="mirror://sourceforge/freetype/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="gui"

DEPEND="
	>=media-libs/freetype-2.4.5
	gui? ( >=dev-qt/qtgui-4.8 )
"

src_configure() {
	econf "$(use_with gui qt)"
}
