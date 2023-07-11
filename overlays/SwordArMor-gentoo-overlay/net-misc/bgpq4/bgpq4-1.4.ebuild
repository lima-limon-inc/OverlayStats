# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="bgp filtering automation tool"
HOMEPAGE="https://github.com/bgp/bgpq4"
SRC_URI="https://github.com/bgp/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default

	./bootstrap
	eautoreconf
}

src_compile() {
	default

	emake dist
}
