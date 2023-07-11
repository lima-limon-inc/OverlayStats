# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/blong42/${PN}/archive/${P}.tar.gz  -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	MY_P="${PN}-${P}"
	S="${WORKDIR}/${MY_P}"
	ECONF_SOURCE="${S}"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/blong42/clearsilver.git"
fi

DESCRIPTION="Clearsilver HTML templating system"
HOMEPAGE="http://clearsilver.net/"
LICENSE="BSD-2"
SLOT="0"
IUSE="compression gettext apache java python perl ruby csharp"

DEPEND="
	dev-libs/streamhtmlparser
	compression? ( sys-libs/zlib )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eaclocal -I m4
	eautoheader
	eautoconf
	# Do not build streamhtmlparser
	sed -i 's/cs: libs\/libstreamhtmlparser.a/cs:/' "${S}/Makefile"
	sed -i 's/streamhtmlparser //g' "${S}/Makefile"
	sed -i 's/$(DLIBS:-l%=$(LIB_DIR)lib%.a)/$(filter-out ..\/libs\/libstreamhtmlparser.a, $(DLIBS:-l%=$(LIB_DIR)lib%.a))/g' "${S}/rules.mk.in"
	# Fix C99 vararg macros (Fix by flyingdutchman23)
	sed -i "s/NE_LOG_WARN,f,__VA_ARGS__)/NE_LOG_WARN,f,##__VA_ARGS__)/" "${S}/util/neo_misc.h"
	sed -i "s/..\/libs\/libstreamhtmlparser.a//g" "${S}/cgi/Makefile"
	# Use Python 2 in Makefile
	sed -i "s/scripts\/document.py/python2 scripts\/document.py/g" "${S}/Makefile"
	# Fix relative paths in headers
	sed -i "s/util\///g" "${S}/util/"*.h
	sed -i "s/util\//..\/util\//g" "${S}/cs/"*.h
	sed -i "s/util\//..\/util\//g" "${S}/cgi/"*.h
	sed -i "s/cs\//..\/cs\//g" "${S}/cgi/"*.h
}

src_compile() {
	emake
	emake man
}

src_configure() {
	econf \
		$(use_enable compression) \
		$(use_enable gettext) \
		$(use_enable apache) \
		$(use_enable java) \
		$(use_enable python) \
		$(use_enable perl) \
		$(use_enable ruby) \
		$(use_enable csharp)
}
