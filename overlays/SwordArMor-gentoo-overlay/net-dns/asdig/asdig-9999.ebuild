# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-r3

DESCRIPTION="Simple client for retrieving AS from IP published via DNS"
HOMEPAGE="https://github.com/Rezopole/asdig"
EGIT_REPO_URI="https://github.com/Rezopole/asdig.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/bin/
	doins "${S}"/asdig || die "Install failed!"
	dodoc README.md
}

pkg_preinst() {
	chmod a+x "${D}"/usr/bin/asdig || die "chmod failed"
}
