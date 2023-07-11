# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.8.2.0.9999
#hackport: flags: -in-ghc-tree

CABAL_FEATURES="" # test-suite
inherit haskell-cabal

RESTRICT="test" # Requires deprecated/buggy haddock-test package

DESCRIPTION="A documentation-generation tool for Haskell libraries"
HOMEPAGE="https://www.haskell.org/haddock/"

LICENSE="BSD"
SLOT="0"
# Keep in sync with ghc-9.4
#KEYWORDS="~amd64 ~amd64-linux"

RDEPEND="
	~dev-haskell/haddock-api-2.27.0:=
	>=dev-lang/ghc-8.8.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-3.0.0.0
"
#	test? (
#		~dev-haskell/haddock-test-0.0.1
#	)

src_configure() {
	haskell-cabal_src_configure \
		--flag=-in-ghc-tree
}