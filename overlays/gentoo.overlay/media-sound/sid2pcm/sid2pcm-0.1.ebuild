# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

SLOT="0"
LICENSE="HPND"
KEYWORDS="~amd64 ~arm ~x86"
DESCRIPTION="Linux console util to decode sid files to raw pcm at stdout"

SRC_URI="https://finalmedia.de/code/${PN}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://finalmedia.de/code/sid"
IUSE=""

RDEPEND=""

DEPEND="${RDEPEND}"

S=${WORKDIR}/${PN}

src_prepare() {
	eapply "${FILESDIR}/gcc-warn.patch"
	eapply_user
	sed -i \
		-e '/^C\?L\?D\?FLAGS/s:^:#:' \
		-e '/^CC/s:^:#:' \
		Makefile || die
}

src_install() {
	dobin sid2pcm
	head -n 33 sid2pcm.c > README
	dodoc README
}
