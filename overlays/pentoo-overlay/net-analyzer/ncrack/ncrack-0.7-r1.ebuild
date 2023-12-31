# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Ncrack is a high-speed network authentication cracking tool"
HOMEPAGE="https://nmap.org/ncrack/"
SRC_URI="https://nmap.org/ncrack/dist/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-libs/openssl"
DEPEND="${RDEPEND}"

PATCHES=( "${FILESDIR}/0.7-ldflags.patch"
	"${FILESDIR}/fix-gcc-10-build.patch"
	)

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" STRIP=true install
}
