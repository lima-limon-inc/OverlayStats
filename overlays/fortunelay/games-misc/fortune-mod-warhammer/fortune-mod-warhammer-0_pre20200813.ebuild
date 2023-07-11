# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

COMMIT="ebc2cb5a2caba072ed674afd00280d90a9e3030b"

DESCRIPTION="Quotes from Warhammer Fantasy and 40000 universes"
HOMEPAGE="https://github.com/Alessandro-Barbieri/fortunes-warhammer"
SRC_URI="https://github.com/Alessandro-Barbieri/fortunes-warhammer/archive/ebc2cb5a2caba072ed674afd00280d90a9e3030b.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/fortunes-warhammer-${COMMIT}"
LICENSE="fairuse"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~m68k ~mips ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-solaris"
IUSE="l10n_en l10n_es l10n_fr l10n_it"

RDEPEND="games-misc/fortune-mod"
BDEPEND="${RDEPEND}"

src_compile() {
	for u in ${IUSE} ; do
		if use "${u}" ; then
			l="${u/l10n_/}"
			pushd "${l}" || die
			mv wh40k "wh40k-${l}" || die
			strfile "wh40k-${l}" || die
			if [ -e fantasy ]; then
				mv fantasy "fantasy-${l}" || die
				strfile "fantasy-${l}" || die
			fi
			popd || die
		fi
	done
}

src_install() {
	insinto /usr/share/fortune
	for u in ${IUSE} ; do
		if use "${u}" ; then
			pushd "${u/l10n_/}" || die
			doins *
			popd || die
		fi
	done
}
