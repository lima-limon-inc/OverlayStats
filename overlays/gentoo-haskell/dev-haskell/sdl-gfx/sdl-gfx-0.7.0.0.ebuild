# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.2

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

MY_PN="SDL-gfx"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Binding to libSDL_gfx"
HOMEPAGE="https://hackage.haskell.org/package/SDL-gfx"
SRC_URI="https://hackage.haskell.org/package/${MY_P}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-haskell/sdl:=[profile?]
	>=dev-lang/ghc-7.4.1:=
	media-libs/sdl-gfx:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.24
"

S="${WORKDIR}/${MY_P}"