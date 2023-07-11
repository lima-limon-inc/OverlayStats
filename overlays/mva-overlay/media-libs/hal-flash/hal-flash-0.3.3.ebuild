# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit multilib-minimal

DESCRIPTION="A libhal stub for flashplayer/adobecp, forwarding specific API parts to UDisks"
HOMEPAGE="https://github.com/cshorler/hal-flash"
SRC_URI="https://github.com/cshorler/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

COMMON_DEPEND="
	dev-libs/glib:2=[${MULTILIB_USEDEP},dbus]
	sys-apps/dbus[${MULTILIB_USEDEP}]
"
RDEPEND="
	${COMMON_DEPEND}
	sys-fs/udisks
"
DEPEND="
	${COMMON_DEPEND}
	virtual/pkgconfig
"

DOCS="FAQ.txt README"
PATCHES=( "${FILESDIR}"/0001-Make-build-work-outside-of-source-tree.patch )
ECONF_SOURCE="${S}"

src_install() {
	multilib-minimal_src_install
	find "${D}" -name '*.la' -delete || die
}
