# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.8.4.0.9999
#hackport: flags: +split-these

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Containers with monoidal accumulation"
HOMEPAGE="https://github.com/bgamari/monoidal-containers"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-haskell/aeson-1.0:=[profile?] <dev-haskell/aeson-2.2
	>=dev-haskell/hashable-1.2:=[profile?] <dev-haskell/hashable-1.5
	>=dev-haskell/lens-4.4:=[profile?] <dev-haskell/lens-5.3
	=dev-haskell/newtype-0.2*:=[profile?]
	>=dev-haskell/semialign-1:=[profile?] <dev-haskell/semialign-1.4
	>=dev-haskell/these-1:=[profile?] <dev-haskell/these-1.3
	=dev-haskell/unordered-containers-0.2*:=[profile?]
	=dev-haskell/witherable-0.4*:=[profile?]
	>=dev-lang/ghc-8.8.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-3.0.0.0
"

src_configure() {
	haskell-cabal_src_configure \
		--flag=split-these
}
