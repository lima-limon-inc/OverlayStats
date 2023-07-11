# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.4.3.9999

CABAL_FEATURES=""
inherit haskell-cabal

DESCRIPTION="Generate Haskell code from a type"
HOMEPAGE="https://hackage.haskell.org/package/djinn"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
	dev-haskell/haskeline
	dev-haskell/mtl
	>=dev-lang/ghc-7.4.1
"

PATCHES=("${FILESDIR}"/${P}-ghc-84.patch)