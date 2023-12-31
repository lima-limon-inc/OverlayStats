# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Printer information files for foomatic-db-engine to generate ppds"
HOMEPAGE="http://www.linuxprinting.org/foomatic.html"
SRC_URI="http://www.openprinting.org/download/foomatic/${PN}-$(ver_rs 2 -).tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 arm ~hppa ~ia64 ~mips ppc ppc64 ~s390 sparc x86"
IUSE=""

DEPEND=""
RDEPEND="
	net-print/foomatic-db-engine
	!net-print/foo2zjs[hp2600n]"

S="${WORKDIR}/${PN}-$(ver_cut 3 ${PV})"

src_prepare() {
	# ppd files do not belong to this package
	rm -r db/source/PPD || die
	default
}

src_configure() {
	econf \
		--disable-gzip-ppds \
		--disable-ppds-to-cups
}

src_install() {
	default
	rmdir "${ED}"/usr/share/foomatic/db/source/PPD || die
	# Avoid collision with foo2zjs, bug 185486
	rm "${ED}"/usr/share/foomatic/db/source/{driver/foo2{hp,lava,xqx,zjs}.xml,printer/{Generic-ZjStream_Printer,HP-{Color_LaserJet_{1500,1600,2600n},LaserJet_{10{00,05,18,20,22},M1005_MFP}},Minolta-{Color_PageWorks_Pro_L,magicolor_2{20,30,43}0_DL},Samsung-CLP-{3,6}00}.xml}  || die
	# Avoid collision with ptouch-driver, bug 264447
	rm "${ED}"/usr/share/foomatic/db/source/{driver/ptouch.xml,printer/Brother-{QL-{5{0,5}0,650TD},PT-{PC,18R,19{5,6}0,1950VP,2300,3600,9{4,6}00,{2450,9200}DX,26{1,0}0,550A,{1500,2420,2500,9{2,5}00}PC}}.xml} || die
}
