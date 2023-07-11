# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit dune

MY_P="${PN}-v${PV}"

DESCRIPTION="IO memory page library for Mirage backends"
HOMEPAGE="
	https://github.com/mirage/io-page
	https://github.com/mirage/io-page
"
SRC_URI="https://github.com/mirage/io-page/releases/download/v${PV}/${MY_P}.tbz"
S="${WORKDIR}/${MY_P}"

LICENSE="ISC"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE="ocamlopt test"

RDEPEND="
	dev-ml/bigarray-compat:=
	dev-ml/cstruct:=
"
DEPEND="
	${RDEPEND}
	test? ( dev-ml/ounit2 )
"
BDEPEND="virtual/pkgconfig"

RESTRICT="!test? ( test )"
PATCHES="${FILESDIR}/${P}-ounit2.patch"
