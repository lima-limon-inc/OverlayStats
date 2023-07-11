# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.5.4.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="XML parser and renderer with HTML 5 quirks mode"
HOMEPAGE="https://github.com/snapframework/xmlhtml"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-haskell/blaze-builder-0.2:=[profile?] <dev-haskell/blaze-builder-0.5:=[profile?]
	>=dev-haskell/blaze-html-0.9:=[profile?] <dev-haskell/blaze-html-0.10:=[profile?]
	>=dev-haskell/blaze-markup-0.8:=[profile?] <dev-haskell/blaze-markup-0.9:=[profile?]
	>=dev-haskell/bytestring-builder-0.10.4.0.2:=[profile?] <dev-haskell/bytestring-builder-0.11:=[profile?]
	>=dev-haskell/parsec-3.1.2:=[profile?] <dev-haskell/parsec-3.2:=[profile?]
	>=dev-haskell/text-0.11:=[profile?] <dev-haskell/text-1.3:=[profile?]
	>=dev-haskell/unordered-containers-0.1.4:=[profile?] <dev-haskell/unordered-containers-0.3:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8.0.4
	test? ( >=dev-haskell/hspec-2.4
		>=dev-haskell/hunit-1.2 <dev-haskell/hunit-1.7 )
"

src_prepare() {
	default

	cabal_chdeps \
		'containers           >= 0.3   && < 0.6' 'containers           >= 0.3' \
		'hspec                      >= 2.4      && <2.5' 'hspec                      >= 2.4'
}