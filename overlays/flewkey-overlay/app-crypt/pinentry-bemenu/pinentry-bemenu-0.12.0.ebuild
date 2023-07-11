# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/t-8ch/pinentry-bemenu.git"
else
	SRC_URI="https://github.com/t-8ch/pinentry-bemenu/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS=""
fi

DESCRIPTION="Pinentry based on bemenu"
HOMEPAGE="https://github.com/t-8ch/pinentry-bemenu"
LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-libs/libassuan
	dev-libs/libgpg-error
	dev-libs/popt
	>=dev-libs/bemenu-0.6.5
"
RDEPEND="${DEPEND}"
BDEPEND=""
