# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

SRC_URI="https://dev.entrouvert.org/releases/lasso/lasso-${PV}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="C library aiming to implement the Liberty Alliance standards"
HOMEPAGE="https://lasso.entrouvert.org/"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DOCS="ChangeLog NEWS README README.JAVA"

CDEPEND="
	>=dev-libs/glib-2.17.0
	dev-libs/libxml2
	dev-libs/libltdl
	dev-libs/openssl:0
	>=dev-libs/xmlsec-1.2.6[openssl] <dev-libs/xmlsec-1.3
	dev-libs/libxslt
	sys-libs/zlib
"
DEPEND=${CDEPEND}
BDEPEND="dev-python/six virtual/pkgconfig"
RDEPEND=${CDEPEND}

src_configure() {

	# Avoid automagic dependencies for now. Disable tests because they
	# do not compile.
	econf \
		--with-default-sign-algo=rsa-sha256 \
		--with-min-hash-algo=sha256 \
		--disable-java \
		--disable-python \
		--disable-php5 \
		--disable-php7 \
		--disable-perl \
		--disable-tests \
		--docdir="/usr/share/doc/${PF}"
}
