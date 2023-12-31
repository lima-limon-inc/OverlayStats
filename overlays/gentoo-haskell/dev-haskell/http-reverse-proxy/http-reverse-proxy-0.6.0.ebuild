# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.5.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Reverse proxy HTTP requests, either over raw sockets or with WAI"
HOMEPAGE="https://github.com/fpco/http-reverse-proxy"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-lang/ghc-7.4.1:=
	   >=dev-haskell/blaze-builder-0.3:=[profile?]
	   >=dev-haskell/case-insensitive-0.4:=[profile?]
	   >=dev-haskell/conduit-1.3:=[profile?]
	   dev-haskell/conduit-extra:=[profile?]
	   >=dev-haskell/http-client-0.3:=[profile?]
	   dev-haskell/network:=[profile?]
	   dev-haskell/resourcet:=[profile?]
	   dev-haskell/streaming-commons:=[profile?]
	   >=dev-haskell/text-0.11:=[profile?]
	   dev-haskell/transformers:=[profile?]
	   >=dev-haskell/unliftio-0.2:=[profile?]
	   >=dev-haskell/wai-3.0:=[profile?]
	   dev-haskell/wai-logger:=[profile?]
	   >=dev-haskell/word8-0.0:=[profile?]
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
	test? ( dev-haskell/blaze-builder
		>=dev-haskell/conduit-1.1
		dev-haskell/conduit-extra
		>=dev-haskell/hspec-1.3
		>=dev-haskell/http-conduit-2.3
		dev-haskell/http-types
		dev-haskell/network
		dev-haskell/resourcet
		dev-haskell/streaming-commons
		dev-haskell/transformers
		dev-haskell/unliftio
		dev-haskell/wai
		>=dev-haskell/warp-2.1 )
"
