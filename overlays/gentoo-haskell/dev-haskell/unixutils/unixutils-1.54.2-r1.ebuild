# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

MY_PN="Unixutils"
MY_P="${MY_PN}-${PV}"
S="${WORKDIR}/${MY_P}"

DESCRIPTION="A crude interface between Haskell and Unix-like operating systems"
HOMEPAGE="https://github.com/seereason/haskell-unixutils.git"
SRC_URI="https://hackage.haskell.org/package/${MY_P}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64"

RDEPEND="dev-haskell/exceptions:=[profile?]
	dev-haskell/mtl:=[profile?]
	>=dev-haskell/process-extras-0.3:=[profile?]
	dev-haskell/puremd5:=[profile?]
	dev-haskell/regex-tdfa:=[profile?]
	dev-haskell/zlib:=[profile?]
	>=dev-lang/ghc-8.4.3:=
	virtual/libcrypt:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
"
