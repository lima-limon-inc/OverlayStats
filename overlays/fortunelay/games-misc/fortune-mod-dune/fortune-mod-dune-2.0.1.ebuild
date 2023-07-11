# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

COMMIT="186f309c5361c5cce920cd6177d35fd18b9589dd"

DESCRIPTION="Quotes from Frank Herbert's Dune Chronicles"
HOMEPAGE="
	https://web.archive.org/web/20050306214019/http://dune.s31.pl:80/
	https://git.incorporeal.org/bss/fortune-mod-dune
	https://github.com/xiongchiamiov/fortune-mod-dune-the-butlerian-jihad
	https://github.com/xiongchiamiov/fortune-mod-the-machine-crusade
"
SRC_URI="
	https://git.incorporeal.org/bss/fortune-mod-dune/archive/${COMMIT}.tar.gz -> ${P}.tar.gz
	https://github.com/xiongchiamiov/fortune-mod-the-machine-crusade/archive/9dd9519459bbda99803e95346648f8992dd395b1.tar.gz
	https://github.com/xiongchiamiov/fortune-mod-dune-the-butlerian-jihad/archive/19cd430541774ca55507e76d6f6eeaf905388b0c.tar.gz
"
S="${WORKDIR}/${PN}"
LICENSE="free-noncomm fairuse WTFPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~m68k ~mips ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-solaris"

RDEPEND="games-misc/fortune-mod"
BDEPEND="${RDEPEND}"

src_prepare() {
	mv "${WORKDIR}"/fortune-mod-the-*/dune* "${S}" || die
	mv "${WORKDIR}"/fortune-mod-dune-*/dune* "${S}" || die
	rm *.dat .message* || die
	eapply_user
}

src_compile() {
	for f in * ; do
		strfile "${f}" || die
	done
}

src_install() {
	insinto /usr/share/fortune
	doins *
}
