# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit readme.gentoo-r1

DESCRIPTION="A docker build environment for firestorm"
HOMEPAGE="https://github.com/lmiphay/firestorm-debian"
SRC_URI="https://github.com/lmiphay/firestorm-debian/archive/0.1.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	app-emulation/docker
	dev-vcs/mercurial
"

DISABLE_AUTOFORMATTING=1
FORCE_PRINT_ELOG=1
DOC_CONTENTS="
  Note: this is the *Mercurial* repo version!

  This is an experimental attempt at building firestorm in a debian docker

  Please report issues at the bug tracker: https://github.com/lmiphay/firestorm-debian/issues
"

DOCS=( "README.md" )

src_install() {
	insinto /usr/share/${PN}
	doins Dockerfile Makefile

	readme.gentoo_create_doc

	default
}

pkg_postinst() {
	readme.gentoo_print_elog
}
