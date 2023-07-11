# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

WX_GTK_VER="3.0-gtk3"

inherit wxwidgets xdg

MY_PV="${PV/_/-}"
MY_P="FileZilla_Pro_${MY_PV}"

DESCRIPTION="Commercial verison of FileZilla"
HOMEPAGE="https://filezillapro.com/"
SRC_URI="https://filezillapro.com/FileZilla_Pro_${PV}_x86_64-linux-gnu.tar.bz2"

SLOT="0"
KEYWORDS="~amd64"

# pugixml 1.7 minimal dependency is for c++11 proper configuration
RDEPEND="
	!!net-ftp/filezilla
	>=app-eselect/eselect-wxwidgets-0.7-r1
	>=dev-libs/nettle-3.1:=
	>=dev-db/sqlite-3.7
	>=dev-libs/pugixml-1.7
	>=net-libs/gnutls-3.5.7
	>=x11-libs/wxGTK-3.0.4:${WX_GTK_VER}[X]
	x11-misc/xdg-utils"
DEPEND="${RDEPEND}"
RESTRICT="fetch"

S="${WORKDIR}"

pkg_nofetch() {
	einfo "Please download"
	#einfo "  - FileZilla_Pro_${PV}_x86_64-linux-gnu.tar.bz2"
	einfo "  - ${A}"
	einfo "from ${HOMEPAGE} and place it in your DISTDIR directory."
}

src_unpack() {
	unpack ${A} || die
	cd ${WORKDIR} || die
	mkdir opt || die
	mv FileZilla3 opt/ || die
}

src_install() {
	doins -r opt
	fperms +x /opt/FileZilla3/bin/filezilla
	fperms +x /opt/FileZilla3/bin/fzputtygen
	fperms +x /opt/FileZilla3/bin/fzsftp
	fperms +x /opt/FileZilla3/bin/fzstorj
	dodir /opt/bin
	dosym ../FileZilla3/bin/filezilla /opt/bin/filezilla
	dosym ../FileZilla3/bin/fzputtygen /opt/bin/fzputtygen
	dosym ../FileZilla3/bin/fzsftp /opt/bin/fzsftp
	dosym ../FileZilla3/bin/fzstorj /opt/bin/fzstorj
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
}

