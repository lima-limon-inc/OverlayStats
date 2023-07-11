# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.1.1.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Concurrency for the pipes ecosystem"
HOMEPAGE="https://hackage.haskell.org/package/pipes-concurrency"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"

RDEPEND=">=dev-haskell/async-2.0.0.0:=[profile?] <dev-haskell/async-2.3:=[profile?]
	>=dev-haskell/contravariant-1.3.3:=[profile?] <dev-haskell/contravariant-1.6:=[profile?]
	>=dev-haskell/pipes-4.0:=[profile?] <dev-haskell/pipes-4.4:=[profile?]
	>=dev-haskell/stm-2.4.3:=[profile?] <dev-haskell/stm-2.6:=[profile?]
	>=dev-haskell/void-0.6:=[profile?] <dev-haskell/void-1:=[profile?]
	>=dev-lang/ghc-8.4.3:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
	test? ( >=dev-haskell/pipes-4.0.0 <dev-haskell/pipes-4.4 )
"