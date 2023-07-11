# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.3.0

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Generates a references DB from .hie files"
HOMEPAGE="https://hackage.haskell.org/package/hiedb"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE="executable"

# Known issue: <https://github.com/wz1000/HieDb/issues/46>
RESTRICT="test" # Two test failures

PATCHES=(
	"${FILESDIR}/${PN}-0.3.0.1-add-executable-flag.patch"
)

CABAL_TEST_REQUIRED_BINS=(
	"${PN}"
)

RDEPEND="
	>=dev-haskell/algebraic-graphs-0.3:=[profile?] <dev-haskell/algebraic-graphs-0.7:=[profile?]
	>=dev-haskell/ansi-terminal-0.9:=[profile?]
	dev-haskell/extra:=[profile?]
	>=dev-haskell/hie-compat-0.3:=[profile?] <dev-haskell/hie-compat-0.4:=[profile?]
	dev-haskell/lucid:=[profile?]
	dev-haskell/optparse-applicative:=[profile?]
	dev-haskell/sqlite-simple:=[profile?]
	>=dev-haskell/terminal-size-0.2:=[profile?]
	>=dev-lang/ghc-8.6.3:=
	executable? (
		dev-haskell/ghc-paths:=[profile?]
	)
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.4.0.1
	test? (
		dev-haskell/hspec
		dev-haskell/temporary
	)
"

src_configure() {
	if use executable || use test; then
		local myExeFlag=executable
	else
		local myExeFlag=-executable
	fi
	haskell-cabal_src_configure \
		--flag="${myExeFlag}"
}

src_install() {
	if use test && ! use executable; then
		# Only install lib (skip exe)
		haskell-cabal_src_install "lib:${PN}"
	else
		# Install everything
		haskell-cabal_src_install
	fi
}