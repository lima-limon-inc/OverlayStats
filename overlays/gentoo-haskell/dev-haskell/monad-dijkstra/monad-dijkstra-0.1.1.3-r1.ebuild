# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.8.4.0.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="A monad transformer for weighted graph searches"
HOMEPAGE="https://github.com/ennocramer/monad-dijkstra"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"

CABAL_CHDEPS=(
	'free >= 4.12.0 && < 5.2' 'free >= 4.12.0'
)

PATCHES=( "${FILESDIR}/${P}-fix-tests.diff" )

RDEPEND="
	>=dev-haskell/free-4.12.0:=[profile?]
	>=dev-haskell/psqueues-0.2.0.0:=[profile?] <dev-haskell/psqueues-0.3:=[profile?]
	>=dev-lang/ghc-8.8.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-3.0.0.0
	test? (
		>=dev-haskell/hlint-1.0 <dev-haskell/hlint-4
		dev-haskell/tasty
		dev-haskell/tasty-hspec
	)
"
