# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.1.1.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Abstraction over creating network connections with SOCKS5 and TLS"
HOMEPAGE="https://github.com/glguy/irc-core"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="ISC"
SLOT="0/${PV}"
KEYWORDS="~amd64"

RDEPEND=">=dev-haskell/async-2.2:=[profile?] <dev-haskell/async-2.3:=[profile?]
	>=dev-haskell/attoparsec-0.14:=[profile?] <dev-haskell/attoparsec-0.15:=[profile?]
	>=dev-haskell/hsopenssl-0.11.2.3:=[profile?] <dev-haskell/hsopenssl-0.12:=[profile?]
	>=dev-haskell/hsopenssl-x509-system-0.1:=[profile?] <dev-haskell/hsopenssl-x509-system-0.2:=[profile?]
	>=dev-haskell/network-3.0:=[profile?] <dev-haskell/network-3.2:=[profile?]
	>=dev-haskell/stm-2.5:=[profile?] <dev-haskell/stm-2.6:=[profile?]
	>=dev-lang/ghc-8.4.3:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
"