# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit dune multiprocessing

DESCRIPTION="RFC3986 URI parsing library for OCaml"
HOMEPAGE="
	https://github.com/mirage/ocaml-uri
	https://opam.ocaml.org/packages/uri/
"
SRC_URI="https://github.com/mirage/ocaml-uri/archive/v${PV}.tar.gz -> ocaml-${P}.tar.gz"
S="${WORKDIR}/ocaml-${P}"

LICENSE="ISC"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE="ocamlopt re sexp test"

RDEPEND="
	>=dev-ml/angstrom-0.14.0:=
	>=dev-ml/stringext-1.4.0:=

	re? ( >=dev-ml/re-1.9.0:= )
	sexp? (
		>=dev-ml/ppx_sexp_conv-0.13.0:=
		dev-ml/sexplib0:=
	)
"
DEPEND="
	${RDEPEND}
	test? (
		dev-ml/ounit2
		>=dev-ml/ppx_sexp_conv-0.9.0
	)
"

RESTRICT="!test? ( test )"
PATCHES="${FILESDIR}/${P}-ounit2.patch"

src_compile() {
	local pkgs="uri"
	for u in sexp re ; do
		if use ${u} ; then
			pkgs="${pkgs},uri-${u}"
		fi
	done
	dune build -p "${pkgs}" -j $(makeopts_jobs) || die
}

src_install() {
	dune_src_install uri
	use re && dune_src_install uri-re
	use sexp && dune_src_install uri-sexp
}
