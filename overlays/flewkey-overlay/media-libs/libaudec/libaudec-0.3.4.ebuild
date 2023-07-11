# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~alextee/libaudec"
else
	SRC_URI="https://git.sr.ht/~alextee/libaudec/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	MY_P="${PN}-v${PV}"
	S="${WORKDIR}/${MY_P}"
fi

DESCRIPTION="A library for reading and resampling audio files"
HOMEPAGE="https://git.zrythm.org/zrythm/libaudec"
LICENSE="AGPL-3"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=dev-util/meson-0.55.0"
