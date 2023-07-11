# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.3.0
#hackport: flags: -devel,-include

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Liquid Types for Haskell"
HOMEPAGE="https://github.com/ucsd-progsys/liquidhaskell"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE="deterministic-profiling mirror-modules-helper no-plugin"

CABAL_CHDEPS=(
	'recursion-schemes    <= 5.2.2' 'recursion-schemes'
	'hashable             >= 1.3 && < 1.3.4' 'hashable >= 1.3'
	'mustache < 2.4' 'mustache'
)

# optparse-applicative needs to be changed three times
CABAL_CHDEPS+=(
	'optparse-applicative < 0.16.0.0' 'optparse-applicative'
	'optparse-applicative < 0.16.0.0' 'optparse-applicative'
	'optparse-applicative < 0.16.1.0' 'optparse-applicative'
)

RDEPEND="
	dev-haskell/aeson:=[profile?]
	dev-haskell/cabal:=[profile?]
	dev-haskell/cereal:=[profile?]
	>=dev-haskell/cmdargs-0.10:=[profile?]
	>=dev-haskell/data-default-0.5:=[profile?]
	dev-haskell/data-fix:=[profile?]
	>=dev-haskell/diff-0.3:=[profile?] <dev-haskell/diff-0.5:=[profile?]
	dev-haskell/extra:=[profile?]
	>=dev-haskell/fingertree-0.1:=[profile?]
	dev-haskell/free:=[profile?]
	>=dev-haskell/ghc-paths-0.1:=[profile?]
	dev-haskell/githash:=[profile?]
	dev-haskell/gitrev:=[profile?]
	>=dev-haskell/hashable-1.3:=[profile?]
	>=dev-haskell/hscolour-1.22:=[profile?]
	>=dev-haskell/liquid-fixpoint-0.8.10.2.1:=[profile?] <dev-haskell/liquid-fixpoint-0.9:=[profile?]
	>=dev-haskell/megaparsec-8:=[profile?]
	>=dev-haskell/optics-0.2:=[profile?]
	dev-haskell/optparse-applicative:=[profile?]
	dev-haskell/optparse-simple:=[profile?]
	dev-haskell/recursion-schemes:=[profile?]
	dev-haskell/split:=[profile?]
	>=dev-haskell/syb-0.4.4:=[profile?]
	>=dev-haskell/temporary-1.2:=[profile?]
	<dev-haskell/th-compat-0.2:=[profile?]
	>=dev-haskell/unordered-containers-0.2.11:=[profile?]
	>=dev-haskell/vector-0.10:=[profile?]
	>=dev-lang/ghc-8.10.1:=
	mirror-modules-helper? (
		dev-haskell/mustache:=[profile?]
		<dev-haskell/shelly-1.10:=[profile?]
	)
"

# cabal-3.4 is bundled with ghc-9.0, so it is always installed
RDEPEND+="
	|| (
		( >=dev-lang/ghc-9.0 <dev-lang/ghc-9.1 )
		<dev-haskell/cabal-3.5
	)
"

# REQUIRES a SMTLIB2 compatible solver e.g. Z3/CVC4/MathSat
# See: <https://ucsd-progsys.github.io/liquidhaskell-tutorial/Tutorial_01_Introduction.html#getting-started>
RDEPEND+="
	|| (
		sci-mathematics/z3
		sci-mathematics/cvc4
	)
"

DEPEND="${RDEPEND}
	>=dev-haskell/cabal-3.2.0.0
	test? (
		>=dev-haskell/optparse-applicative-0.11
		>=dev-haskell/stm-2.4
		>=dev-haskell/string-conv-0.1
		>=dev-haskell/tagged-0.7.3
		>=dev-haskell/tasty-1.4.2
		dev-haskell/tasty-ant-xml
		>=dev-haskell/tasty-golden-2.0.0
		>=dev-haskell/tasty-hunit-0.9
		>=dev-haskell/tasty-rerun-1.1
	)
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag deterministic-profiling deterministic-profiling) \
		--flag=-devel \
		--flag=-include \
		$(cabal_flag mirror-modules-helper mirror-modules-helper) \
		$(cabal_flag no-plugin no-plugin)
}