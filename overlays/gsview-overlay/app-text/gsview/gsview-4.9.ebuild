# Copyright 1999-2012 Gentoo Foundation
# Copyright 2016-2017 Michael Uleysky
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit toolchain-funcs desktop

MY_PV="${PV/.}"

DESCRIPTION="gsView PostScript and PDF viewer"
HOMEPAGE="http://www.cs.wisc.edu/~ghost/gsview/"
SRC_URI="ftp://mirror.cs.wisc.edu/pub/mirrors/ghost/ghostgum/gsview-${PV}.tar.gz ftp://ftp.dvo.ru/pub/Gentoo/distfiles/gsview-${PV}.tar.gz"

IUSE="doc epstool pstotext"
SLOT="0"
LICENSE="Aladdin"
KEYWORDS="amd64 hppa ppc x86 ~amd64-linux ~x86-linux arm arm64"

RDEPEND="x11-libs/gtk+:1
	epstool? ( app-text/epstool )
	pstotext? ( app-text/pstotext )
	app-text/ghostscript-gpl"
DEPEND="app-arch/unzip
	x11-libs/gtk+:1"

PATCHES=(
	"${FILESDIR}/${PV}-gentoo.patch"
	"${FILESDIR}/${P}-libdl.patch"
	"${FILESDIR}/${P}-rev.patch"
)

src_prepare() {
	default
	ln -sf srcunx/unx.mak Makefile || die

	## respect CFLAGS
	sed -i -e "s:^CFLAGS=-O :CFLAGS=${CFLAGS} :g" Makefile || die
	sed -i -e "s:GSVIEW_DOCPATH:\"${EPREFIX}/usr/share/doc/${PF}/html/\":" srcunx/gvx.c || die
}

src_compile() {
	## run Makefile
	# bug #283165
	emake -j1 || die "Error compiling files."
}

src_install() {
	dobin bin/gsview || die

	doman srcunx/gsview.1 || die

	dodoc gsview.css cdorder.txt regorder.txt || die

	if use doc; then
		dobin "${FILESDIR}"/gsview-help || die
		dohtml *.htm bin/*.htm || die
	fi

	insinto /etc/gsview
	doins src/printer.ini || die

	make_desktop_entry gsview Gsview "" "Office" || die "Couldn't make gsview desktop entry"
}
