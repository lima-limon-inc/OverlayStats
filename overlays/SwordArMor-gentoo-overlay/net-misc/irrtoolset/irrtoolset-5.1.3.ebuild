# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit autotools

DESCRIPTION="The Internet Routing Registry Toolset"
HOMEPAGE="https://github.com/irrtoolset/irrtoolset"
SRC_URI="https://github.com/${PN}/${PN}/archive/refs/tags/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="sys-libs/readline"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}-release-${PV}"
DOCS=( AUTHORS COPYING NEWS README.md examples/ )

src_prepare() {
	default
	eautoreconf
}
