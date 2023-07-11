# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/cc65/cc65.git"
else
	SRC_URI="https://github.com/cc65/cc65/archive/V${PV}.tar.gz  -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A C compiler for 6502-based systems"
HOMEPAGE="https://cc65.github.io/"
LICENSE="ZLIB"
IUSE="doc"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="doc? ( app-text/linuxdoc-tools )"

src_compile() {
	emake PREFIX="/usr"
	use doc && emake -C doc
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" DESTPACKAGE_SUFFIX="-${PV}" install
}
