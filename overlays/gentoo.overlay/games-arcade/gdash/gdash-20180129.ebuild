# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

MY_P="${P}unstable"

SLOT="0"
LICENSE="MIT"
KEYWORDS="~amd64 ~arm ~x86"
DESCRIPTION="Clone of Boulderdash (a.k.a Emerald Mine on the Amiga)"

SRC_URI="https://bitbucket.org/czirkoszoltan/${PN}/downloads/${MY_P}.tar.gz"
HOMEPAGE="https://bitbucket.org/czirkoszoltan/gdash/"

IUSE=""

RDEPEND="media-libs/sdl2-mixer[vorbis]
	media-libs/sdl2-image[png]
	x11-libs/gtk+:2"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

S="${WORKDIR}/${MY_P}"

src_install() {
	default

	domenu gdash.desktop
	doicon gdash.png
}
