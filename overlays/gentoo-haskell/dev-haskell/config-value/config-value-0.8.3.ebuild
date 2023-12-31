# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.8.4.0.9999

CABAL_HACKAGE_REVISION=3

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Simple, layout-based value language similar to YAML or JSON"
HOMEPAGE="https://github.com/glguy/config-value"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-haskell/text-1.2.0.4:=[profile?] <dev-haskell/text-2.1
	>=dev-lang/ghc-8.8.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/alex-3.2
	>=dev-haskell/cabal-3.0.0.0
	>=dev-haskell/happy-1.19 <dev-haskell/happy-1.21
"
