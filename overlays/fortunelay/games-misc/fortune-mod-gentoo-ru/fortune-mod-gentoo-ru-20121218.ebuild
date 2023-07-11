# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Fortune database of quotes from gentoo.ru forum and gentoo@conference.gentoo.ru"
HOMEPAGE="http://fortunes.gentoo.ru"
SRC_URI="http://fortunes.gentoo.ru/static/files/fortune-mod-gentoo-ru-${PV}.gz"
S="${WORKDIR}"
LICENSE="fairuse"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="games-misc/fortune-mod"
BDEPEND="${RDEPEND}"

src_compile() {
	mv "${P}" gentoo-ru || die
	strfile gentoo-ru || die
}

src_install() {
	insinto /usr/share/fortune
	doins gentoo-ru gentoo-ru.dat
}
