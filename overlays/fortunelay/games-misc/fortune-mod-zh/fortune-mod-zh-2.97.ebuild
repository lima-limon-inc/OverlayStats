# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Chinese fortunes cookies"
HOMEPAGE="https://tracker.debian.org/pkg/fortunes-zh"
SRC_URI="http://ftp.fi.debian.org/debian/pool/main/f/fortune-zh/fortunes-zh_2.97_all.deb"
S="${WORKDIR}"
LICENSE="GPL-3+ fairuse"
SLOT="0"
KEYWORDS="amd64 arm m68k mips ppc64 s390 x86"

PATCHES=( "${FILESDIR}/fix-fortune-path.patch" )

RDEPEND="games-misc/fortune-mod"

src_unpack() {
	default
	tar -xJf data.tar.xz || die

	pushd usr/share/doc/fortunes-zh || die
	gunzip changelog.gz || die
	popd || die

	pushd usr/share/man/man6 || die
	gunzip  fortune-zh.6.gz
	popd || die

	pushd usr/share/man/zh_CN/man6 || die
	gunzip fortune-zh.6.gz
	popd || die
}

src_install() {
	dobin usr/games/fortune-zh
	doman usr/share/man/man6/*
	doman -i18n=zh_CN usr/share/man/zh_CN/man6/*
	insinto /usr/share/fortune
	doins -r usr/share/games/fortunes/.
	dodoc -r usr/share/doc/fortunes-zh/.
}
