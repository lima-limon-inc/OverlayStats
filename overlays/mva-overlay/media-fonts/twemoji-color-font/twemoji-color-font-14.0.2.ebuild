# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="A color and B&W emoji SVG-in-OT font with ZWJ, skin tone mods and country flags"
HOMEPAGE="https://github.com/eosrei/twemoji-color-font"
SRC_URI="https://github.com/eosrei/twemoji-color-font/releases/download/v${PV//_/-}/TwitterColorEmoji-SVGinOT-Linux-${PV//_/-}.tar.gz"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
LICENSE="MIT"
SLOT="0"

RDEPEND="
	media-fonts/ttf-bitstream-vera[X(+)]
	media-fonts/roboto[X(+)]
	media-fonts/noto[X(+)]
"

FONT_SUFFIX="ttf"
DOCS="README.md"
FONT_CONF=( fontconfig/56-twemoji-color.conf )

S="${WORKDIR}/TwitterColorEmoji-SVGinOT-Linux-${PV//_/-}"
