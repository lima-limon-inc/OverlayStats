# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://git.zrythm.org/zrythm/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${PN}"
else
	inherit git-r3
	EGIT_REPO_URI="https://git.zrythm.org/zrythm/zplugins.git"
fi

DESCRIPTION="A collection of audio DSP plugins"
HOMEPAGE="https://git.zrythm.org/zrythm/zplugins"
LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-scheme/guile
	media-libs/libsndfile
	x11-libs/ztoolkit[rsvg]
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local emesonargs=(
		"-Dlv2dir=$(get_libdir)/lv2"
	)
	meson_src_configure
}
