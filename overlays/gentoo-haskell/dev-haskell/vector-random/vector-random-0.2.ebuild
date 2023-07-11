# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.3.3.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Generate vectors filled with high quality pseudorandom numbers"
HOMEPAGE="http://code.haskell.org/~dons/code/vector-random"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"

RDEPEND="dev-haskell/mersenne-random-pure64:=[profile?]
	>=dev-haskell/vector-0.5:=[profile?]
	>=dev-lang/ghc-6.10.4:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6.0.3
"

PATCHES=(	"${FILESDIR}/${P}-ghc.patch"
			"${FILESDIR}/${P}-vector-0.11.patch" )