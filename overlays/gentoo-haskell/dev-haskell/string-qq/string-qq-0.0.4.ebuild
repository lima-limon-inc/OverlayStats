# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.8.2.1.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="QuasiQuoter for non-interpolated strings, texts and bytestrings"
HOMEPAGE="https://hackage.haskell.org/package/string-qq"

LICENSE="public-domain"
SLOT="0/${PV}"
KEYWORDS="~amd64"

CABAL_CHDEPS=(
	'text >=1.2 && <1.3' 'text >=1.2'
)

RDEPEND="
	>=dev-lang/ghc-8.8.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-3.0.0.0
	test? (
		>=dev-haskell/hunit-1.6 <dev-haskell/hunit-1.7
		>=dev-haskell/text-1.2
	)
"