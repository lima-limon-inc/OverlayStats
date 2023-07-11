# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.8.0.0.9999

CABAL_HACKAGE_REVISION=1

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Shell programming, Haskell-style"
HOMEPAGE="https://hackage.haskell.org/package/turtle"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-haskell/ansi-wl-pprint-0.6:=[profile?] <dev-haskell/ansi-wl-pprint-0.7:=[profile?]
	>=dev-haskell/async-2.0.0.0:=[profile?] <dev-haskell/async-2.3:=[profile?]
	>=dev-haskell/clock-0.4.1.2:=[profile?] <dev-haskell/clock-0.9:=[profile?]
	>=dev-haskell/foldl-1.1:=[profile?] <dev-haskell/foldl-1.5:=[profile?]
	<dev-haskell/hostname-1.1:=[profile?]
	>=dev-haskell/managed-1.0.3:=[profile?] <dev-haskell/managed-1.1:=[profile?]
	>=dev-haskell/optional-args-1.0:=[profile?] <dev-haskell/optional-args-2.0:=[profile?]
	>=dev-haskell/optparse-applicative-0.16:=[profile?] <dev-haskell/optparse-applicative-0.18:=[profile?]
	|| ( dev-lang/ghc ( >=dev-haskell/process-1.0.1.1[profile?] <dev-haskell/process-1.7[profile?] ) )
	<dev-haskell/stm-2.6:=[profile?]
	<dev-haskell/streaming-commons-0.3:=[profile?]
	<dev-haskell/temporary-1.4:=[profile?]
	>=dev-haskell/unix-compat-0.4:=[profile?] <dev-haskell/unix-compat-0.7:=[profile?]
	>=dev-lang/ghc-8.10.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-3.2.0.0
	test? (
		>=dev-haskell/doctest-0.7
		>=dev-haskell/tasty-1.4 <dev-haskell/tasty-1.5
		>=dev-haskell/tasty-hunit-0.10 <dev-haskell/tasty-hunit-0.11
	)
"