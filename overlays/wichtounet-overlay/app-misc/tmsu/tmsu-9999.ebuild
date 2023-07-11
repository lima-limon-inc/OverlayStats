# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

DESCRIPTION="TMSU: Tagging file management system"
HOMEPAGE="http://tmsu.org/"

inherit eutils git-r3

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	>=dev-lang/go-1.1.1
	=dev-go/fuse-9999
	=dev-go/sqlite3-9999"

DEPEND="
	dev-vcs/git
	${RDEPEND}"

EGIT_REPO_URI="https://github.com/oniony/TMSU"

src_compile(){
	emake
}

src_install() {
	dobin bin/tmsu
	dobin misc/bin/tmsu-fs-merge
	dobin misc/bin/tmsu-fs-mv
	dobin misc/bin/tmsu-fs-rm
	dosbin misc/bin/mount.tmsu
	doman misc/man/tmsu.1

	insinto /usr/share/zsh/site-functions/
	newins misc/zsh/_tmsu _tmsu
}
