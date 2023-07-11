# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="OMEMO (XEP-0384) extension for libpurple"
HOMEPAGE="https://github.com/gkdr/lurch/"
SRC_URI="https://github.com/gkdr/lurch/releases/download/v${PV}/lurch-${PV}-src.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 ~x86 ~arm"
IUSE=""

BDEPEND="
	dev-util/cmake
	virtual/pkgconfig
"
DEPEND="
	dev-db/sqlite:3
	dev-libs/glib:2
	dev-libs/libgcrypt:0=
	dev-libs/libxml2
	dev-libs/mxml
	net-im/pidgin
"
RDEPEND="${DEPEND}"

src_compile() {
	emake \
		CC="$(tc-getCC)" \
		PKG_CONFIG="$(tc-getPKG_CONFIG)" \
		XML2_CONFIG="${EPREFIX}/usr/bin/${CHOST}-xml2-config" \
		LIBGCRYPT_CONFIG="${EPREFIX}/usr/bin/${CHOST}-libgcrypt-config"
}
