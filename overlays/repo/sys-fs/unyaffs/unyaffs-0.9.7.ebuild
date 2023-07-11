# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A program to extract files from a yaffs image"
HOMEPAGE="https://web.archive.org/web/20200807212923/https://www.b-ehlers.de/projects/unyaffs.html"
SRC_URI="https://deb.debian.org/debian/pool/main/u/unyaffs/unyaffs_$PV.orig.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	mkdir -pv "$D/usr/bin" "$D/usr/share/man/man1"
	cp -v "unyaffs" "$D/usr/bin"
	cp -v "unyaffs.1" "$D/usr/share/man/man1"
}
