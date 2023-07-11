# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.8.1.0.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Parse source to template-haskell abstract syntax"
HOMEPAGE="https://hackage.haskell.org/package/haskell-src-meta"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-haskell/haskell-src-exts-1.21:=[profile?] <dev-haskell/haskell-src-exts-1.24:=[profile?]
	>=dev-haskell/syb-0.1:=[profile?] <dev-haskell/syb-0.8:=[profile?]
	>=dev-haskell/th-orphans-0.12:=[profile?] <dev-haskell/th-orphans-0.14:=[profile?]
	>=dev-lang/ghc-8.8.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-3.0.0.0
	test? (
		>=dev-haskell/hunit-1.2
		dev-haskell/tasty
		dev-haskell/tasty-hunit
	)
"