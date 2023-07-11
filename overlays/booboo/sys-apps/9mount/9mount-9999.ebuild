# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

DESCRIPTION="A set of SUID mounting tools for use with v9fs."
HOMEPAGE="http://github.com/minad/9mount"
EGIT_REPO_URI="https://github.com/minad/9mount.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""

src_install() {
	dobin 9mount 9umount 9bind
	fperms 4755 /usr/bin/{9mount,9umount,9bind}
}
