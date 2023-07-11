# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit eutils git-r3

DESCRIPTION="Squeezebox ShairPort2 Helper"
HOMEPAGE="https://github.com/disaster123/shairport2_plugin"
EGIT_REPO_URI="https://github.com/disaster123/shairport2_plugin.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/openssl"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/shairport_helper/src"

src_prepare() {
	sed -i -e 's;CFLAGS;MYCFLAGS;g' "Makefile.default"
	sed -i -e 's;-Wall -O2 -fPIC;$(CFLAGS);' "Makefile.default"
	sed -i -e 's;LDFLAGS;MYLDFLAGS;g' "Makefile.default"
	sed -i -e 's;-static;$(LDFLAGS);' "Makefile.default"
	# remove references to libao - not used
	sed -i '/cflags ao/d' "Makefile.default"
	sed -i '/libs ao/d' "Makefile.default"
	sed -i '/strip /d' "Makefile.default"
	eapply_user
}

src_install() {
	newbin shairport_helper shairport2_helper
	dodoc README.md
}
