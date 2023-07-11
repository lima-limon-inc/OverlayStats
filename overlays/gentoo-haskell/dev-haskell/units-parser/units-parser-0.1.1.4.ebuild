# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.7.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="A parser for units of measure"
HOMEPAGE="https://hackage.haskell.org/package/units-parser"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"

RDEPEND=">=dev-haskell/mtl-1.1:=[profile?]
	>=dev-haskell/multimap-1.2:=[profile?]
	>=dev-haskell/parsec-3:=[profile?]
	>=dev-lang/ghc-8.4.3:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
	test? ( >=dev-haskell/syb-0.3
		>=dev-haskell/tasty-0.8
		>=dev-haskell/tasty-hunit-0.8 )
"