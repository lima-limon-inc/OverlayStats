# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.1.1.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Interface for JavaScript that works with GHCJS and GHC"
HOMEPAGE="https://hackage.haskell.org/package/jsaddle-wkwebview"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE="+include-app-delegate"

RDEPEND=">=dev-haskell/aeson-0.8.0.2:=[profile?] <dev-haskell/aeson-2.1:=[profile?]
	dev-haskell/data-default:=[profile?]
	>=dev-haskell/jsaddle-0.9.4.0:=[profile?] <dev-haskell/jsaddle-0.10:=[profile?]
	>=dev-lang/ghc-8.4.3:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag include-app-delegate include-app-delegate)
}