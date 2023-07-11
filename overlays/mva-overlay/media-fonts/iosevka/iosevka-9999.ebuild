# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font git-r3

DESCRIPTION="Open source coding font"
HOMEPAGE="https://be5invis.github.io/Iosevka"
EGIT_REPO_URI="https://github.com/be5invis/Iosevka"

LICENSE="OFL-1.1"
SLOT="0"
IUSE="web"
RESTRICT="binchecks strip network-sandbox"

# TODO: do something with network-sandbox incompatibility

BDEPEND="
	net-libs/nodejs
	media-gfx/fontforge
	media-gfx/ttfautohint
	media-gfx/otfcc
	web? (
		media-gfx/sfnt2woff
		media-libs/woff2
	)
"

FONT_S="${S}/fonts_dist"
FONT_SUFFIX="ttf"

src_compile() {
	npm install
	npm run build -- contents::iosevka
}

src_install() {
	mkdir -p "${FONT_S}"
	local font_dir="${S}/dist/${PN}/ttf"
	find "${font_dir}" -name '*.ttf' -print0 | xargs -0 -r mv -u -t "${FONT_S}"
	font_src_install
	use web && (
		insinto /usr/share/webfonts/"${PN}"
		doins -r dist/iosevka/woff2/* dist/iosevka/"${PN}".css
	)
}
