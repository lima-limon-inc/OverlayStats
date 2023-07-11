# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Simple client for retrieving AS from IP published via DNS"
HOMEPAGE="https://github.com/Rezopole/asdig"
MY_GITHUB_AUTHOR="Rezopole"
SRC_URI="https://github.com/${MY_GITHUB_AUTHOR}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}
