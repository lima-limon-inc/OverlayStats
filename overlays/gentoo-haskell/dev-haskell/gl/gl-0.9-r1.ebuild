# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.4
#hackport: flags: -useglxgetprocaddress,-usenativewindowslibraries

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Complete OpenGL raw bindings"
HOMEPAGE="https://hackage.haskell.org/package/gl"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-haskell/fixed-0.2.1:=[profile?]
	>=dev-haskell/half-0.2:=[profile?] <dev-haskell/half-0.4:=[profile?]
	>=dev-lang/ghc-7.8.2:=
	virtual/opengl
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.24
"

src_prepare() {
	default

	cabal_chdeps \
		'fixed >= 0.2.1 && < 0.3' 'fixed >= 0.2.1'
}

src_configure() {
	haskell-cabal_src_configure \
		--flag=-useglxgetprocaddress \
		--flag=-usenativewindowslibraries
}