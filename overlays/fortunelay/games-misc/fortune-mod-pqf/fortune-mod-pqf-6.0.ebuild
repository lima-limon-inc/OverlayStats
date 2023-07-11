# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Fortune database of Terry Pratchett's Discworld related quotes"
HOMEPAGE="http://www.lspace.org"
SRC_URI="http://www.ie.lspace.org/ftp-lspace/words/pqf/pqf-${PV}"
S="${WORKDIR}"
LICENSE="GPL-2 fairuse"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~m68k ~mips ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-solaris"

BDEPEND="games-misc/fortune-mod"
RDEPEND="${BDEPEND}"

src_prepare() {
	cp "${DISTDIR}/"${A} "${S}"/pqf-${PV} || die
	eapply_user
}

src_compile() {
	uniq "pqf-${PV}" | sed 's/^$/\%/g' > pqf || die
	echo "%" >> pqf || die
	strfile -r pqf || die
}

src_install() {
	insinto /usr/share/fortune
	doins pqf pqf.dat
}
