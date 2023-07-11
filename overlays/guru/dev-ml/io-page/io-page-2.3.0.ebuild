# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit dune multiprocessing

MY_P="${PN}-v${PV}"

DESCRIPTION="IO memory page library for Mirage backends"
HOMEPAGE="
	https://github.com/mirage/io-page
	https://opam.ocaml.org/packages/io-page/
"
SRC_URI="https://github.com/mirage/io-page/releases/download/v${PV}/${MY_P}.tbz"
S="${WORKDIR}/${MY_P}"

LICENSE="ISC"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE="ocamlopt test unix"

RDEPEND="
	dev-ml/bigarray-compat:=
	>=dev-ml/cstruct-2.0.0:=
"
DEPEND="
	${RDEPEND}
	test? ( dev-ml/ounit2 )
	unix? ( dev-ml/configurator )
"

RESTRICT="!test? ( test )"
REQUIRED_USE="test? ( unix )"
PATCHES="${FILESDIR}/${PN}-2.3.0-ounit2.patch"

src_compile() {
	local pkgs="io-page"
	use unix && pkgs="${pkgs},io-page-unix"
	dune build -p "${pkgs}" -j $(makeopts_jobs) || die
}

src_install() {
	dune_src_install io-page
	use unix && dune_src_install io-page-unix
}
