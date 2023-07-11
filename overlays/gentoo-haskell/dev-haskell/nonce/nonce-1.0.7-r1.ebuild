# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.5.5.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Generate cryptographic nonces"
HOMEPAGE="https://github.com/prowdsponsor/nonce"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-haskell/base64-bytestring-1.0:=[profile?] <dev-haskell/base64-bytestring-1.3:=[profile?]
	>=dev-haskell/entropy-0.3.7:=[profile?]
	>=dev-haskell/text-0.9:=[profile?]
	dev-haskell/unliftio:=[profile?]
	dev-haskell/unliftio-core:=[profile?]
	>=dev-lang/ghc-7.8.2:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.18.1.3
"

src_prepare() {
	default

	cabal_chdeps \
		'base64-bytestring == 1.0.*' 'base64-bytestring >= 1.0 && < 1.3' \
		'entropy           >= 0.3.7 && < 0.4.2' 'entropy           >= 0.3.7'
}