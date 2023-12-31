# Copyright 2019-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Codon usage bias (composition) and its statistical significance"
HOMEPAGE="https://bigd.big.ac.cn/tools/cat"
SRC_URI="ftp://download.big.ac.cn/bigd/tools/${PN}${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

PATCHES=( "${FILESDIR}"/CAT-1.3_respect_env_variables.patch )

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}${PV}"

src_compile(){
	cd src || die
	emake
}

src_install(){
	dodoc README.TXT
	newdoc doc/CAT-DOC.pdf "${PN}".pdf
	cd src || die
	dobin CAT
}
