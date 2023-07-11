# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION=" Utility and C Library for parsing MRT files"
HOMEPAGE="https://github.com/RIPE-NCC/bgpdump"
SRC_URI="https://github.com/RIPE-NCC/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	app-arch/bzip2
	sys-libs/zlib
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}
