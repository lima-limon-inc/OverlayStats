# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="C++ wrapper for PCRE2 library"
HOMEPAGE="https://github.com/jpcre2/jpcre2"
EGIT_REPO_URI="https://github.com/jpcre2/jpcre2.git"
SRC_URI="https://github.com/jpcre2/jpcre2/archive/refs/tags/10.32.01.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE="debug doc"

DEPEND=">=dev-libs/libpcre2-10.21"
RDEPEND="${DEPEND}"

DOCS=( README.md )

src_prepare() {
# Rerun autotools
einfo "Regenerating autotools files..."
eaclocal
eautoconf
eapply_user
}

src_compile() {
econf --enable-cpp11
emake
}
