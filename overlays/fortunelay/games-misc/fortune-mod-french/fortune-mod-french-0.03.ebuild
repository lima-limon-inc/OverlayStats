# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils

DESCRIPTION="set of fortunes in french"
HOMEPAGE="
	http://www.fortunes-fr.org
	http://www.le-gnu.net
"
SRC_URI="
	http://gnu.free.fr/chapitres/unix/gge.tgz
	http://gnu.free.fr/chapitres/unix/gmp.tgz
	http://gnu.free.fr/chapitres/unix/gnu.tgz
	http://gnu.free.fr/chapitres/unix/npc.tgz
"
S="${WORKDIR}"
LICENSE="GPL-2 fairuse"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="games-misc/fortune-mod"
RDEPEND="${BDEPEND}"

src_prepare() {
	eapply_user
	rm *.dat gnu/*.dat || die
}

src_compile() {
	for f in * ; do
		strfile "${f}" || die
	done
	pushd gnu || die
	for f in * ; do
		strfile "${f}" || die
	done
	popd || die
}

src_install() {
	insinto /usr/share/fortune
	pushd gnu || die
	doins *
	popd || die
	rm -r gnu || die
	doins *
}
