# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.5.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Generate XML sitemaps"
HOMEPAGE="http://www.yesodweb.com/"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-haskell/conduit:=[profile?]
	dev-haskell/data-default:=[profile?]
	dev-haskell/text:=[profile?]
	>=dev-haskell/xml-conduit-1.0:=[profile?]
	dev-haskell/xml-types:=[profile?]
	>=dev-haskell/yesod-core-1.6:=[profile?] <dev-haskell/yesod-core-1.7:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6
"