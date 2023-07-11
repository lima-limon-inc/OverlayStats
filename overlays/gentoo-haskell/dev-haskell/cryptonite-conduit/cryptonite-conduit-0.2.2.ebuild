# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.5.4

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="cryptonite conduit"
HOMEPAGE="https://github.com/haskell-crypto/cryptonite-conduit"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE=""

RESTRICT=test # test suite fails to build

RDEPEND="dev-haskell/conduit:=[profile?]
	dev-haskell/conduit-extra:=[profile?]
	dev-haskell/cryptonite:=[profile?]
	dev-haskell/exceptions:=[profile?]
	dev-haskell/memory:=[profile?]
	dev-haskell/resourcet:=[profile?]
	>=dev-lang/ghc-7.8.2:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.18.1.3
	test? ( dev-haskell/conduit-combinators
		dev-haskell/tasty
		dev-haskell/tasty-hunit
		dev-haskell/tasty-quickcheck )
"