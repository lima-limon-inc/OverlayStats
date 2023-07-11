# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sr.ht/~hannes/airwindows-lv2"
else
	SRC_URI="https://git.sr.ht/~hannes/airwindows-lv2/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	MY_PV="v${PV}"
	MY_P="${PN}-${MY_PV}"
	S="${WORKDIR}/${MY_P}"
fi

DESCRIPTION="A port of Airwindows plugins to LV2"
HOMEPAGE="https://sr.ht/~hannes/airwindows-lv2/"
LICENSE="MIT"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="media-libs/lv2"
