# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.3.0

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Lift computations from the bottom of a transformer stack"
HOMEPAGE="https://github.com/mvv/transformers-base"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~amd64-linux"
IUSE="+orphaninstances"

RDEPEND=">=dev-haskell/stm-2.3:=[profile?]
	>=dev-haskell/transformers-compat-0.6.1:=[profile?]
	>=dev-lang/ghc-8.4.3:=
	orphaninstances? ( >=dev-haskell/base-orphans-0.3:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag orphaninstances orphaninstances)
}