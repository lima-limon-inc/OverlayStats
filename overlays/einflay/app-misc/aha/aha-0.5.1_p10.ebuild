# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit vcs-snapshot toolchain-funcs

DESCRIPTION="Ansi HTML Adapter"
HOMEPAGE="https://github.com/theZiz/aha
http://ziz.delphigl.com/tool_aha.php"
LICENSE="|| ( MPL-1.0 LGPL-2+ ) "
IUSE=""
KEYWORDS="~amd64 ~x86"
SLOT="0"

GITHUB_ACCOUNT="theZiz"
GITHUB_REPONAME="aha"
EGIT_COMMIT="986eab3df6a075f4d509511e3a8fcfead6c4c26b"
EGIT_BRANCH="master"
SRC_URI="https://codeload.github.com/${GITHUB_ACCOUNT}/${GITHUB_REPONAME}/tar.gz/${EGIT_COMMIT} -> ${P}.tar.gz"

src_prepare(){
	default
	tc-export CC
}

src_install() {
	emake PREFIX="${EPREFIX}//usr" DESTDIR="${D}" install
}
