# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.7.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="The MonadUnliftIO typeclass for unlifting monads to IO"
HOMEPAGE="https://github.com/fpco/unliftio/tree/master/unliftio-core#readme"
SRC_URI="
	https://hackage.haskell.org/package/${P}/${P}.tar.gz
	https://hackage.haskell.org/package/${P}/revision/1.cabal -> ${PF}.cabal"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64"

RDEPEND=">=dev-lang/ghc-8.4.3:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
"

src_prepare() {
	default

	# pull newer cabal file from hackage revision.
	cp "${DISTDIR}/${PF}.cabal" "${S}/${PN}.cabal" || die
}
