# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

go-module_set_globals

DESCRIPTION="A terminal based Matrix client written in Go"
HOMEPAGE="https://github.com/tulir/gomuks"
SRC_URI="
	https://github.com/tulir/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://herbizarre.swordarmor.fr/garbage/${P}-vendor.tar.xz
"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+encryption"

DEPEND="encryption? ( dev-libs/olm )"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	use encryption || export CGO_ENABLED=0
	go build . || die "go build failed"
}

src_install() {
	dobin ${PN}
}
