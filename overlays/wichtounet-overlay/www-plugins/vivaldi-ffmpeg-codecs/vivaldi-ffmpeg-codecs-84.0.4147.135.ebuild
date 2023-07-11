# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Additional proprietary codecs for Vivaldi web browser, stable release."
HOMEPAGE="http://www.vivaldi.net"
SRC_URI="http://repo.herecura.eu/herecura/x86_64/${P}-1-x86_64.pkg.tar.zst -> ${P}.tar.zst"

LICENSE="LGPL2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="www-client/vivaldi
        app-arch/zstd"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_unpack() {
   tar -xpf ${DISTDIR}/${P}.tar.zst -C ${S}
}

src_install() {
   cd ${S}
   mkdir -p ${D}/opt/vivaldi/
   cp ${S}/opt/vivaldi/libffmpeg.so.3.2 ${D}/opt/vivaldi/libffmpeg.so.3.2
   cd ${D}/opt/vivaldi/ && ln -s libffmpeg.so.3.2 libffmpeg.so
}
