# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="Peter Gutmann's ASN.1 dump utility"
HOMEPAGE="https://www.cs.auckland.ac.nz/~pgut001/"
SRC_URI="mirror://gentoo/dumpasn1-${PV}.tar.xz"

# This isn't quite right. Fix this.
LICENSE="WTFPL-2"

SLOT="0"

KEYWORDS="~amd64 ~x86"
S=${WORKDIR}

src_prepare() {
	epatch "${FILESDIR}/${P}-config-file-path.patch"
	default
}

src_compile() {
	gcc ${CFLAGS} dumpasn1.c -o dumpasn1
}

src_install() {
	dobin dumpasn1

	insinto /usr/share/${PN}
	doins ${PN}.cfg
}
