# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.savannah.nongnu.org/git/exosip.git"
else
	SRC_URI="mirror://nongnu/exosip/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="The best abstraction layer over SIP. Period."
HOMEPAGE="https://www.antisip.com/"
LICENSE="GPL-2"
SLOT="0"
IUSE="+ssl +srv"

DEPEND="
	net-libs/libosip2
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	econf \
		$(use_enable ssl openssl) \
		$(use_enable srv srvrec)
}
