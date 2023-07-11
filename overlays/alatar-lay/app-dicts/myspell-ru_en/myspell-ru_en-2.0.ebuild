# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

MYSPELL_DICT=(
	"Russian-English_Bilingual.aff"
	"Russian-English_Bilingual.dic"
)

MYSPELL_HYPH=(
)

MYSPELL_THES=(
)

inherit myspell-r2

DESCRIPTION="Russian English mixed dictionaries for myspell/hunspell"
HOMEPAGE="https://addons.mozilla.org/en-US/firefox/addon/russian-english-dictionary/"
SRC_URI="https://addons.mozilla.org/firefox/downloads/file/1167355/russian_english_dictionary-1.0.xpi"

SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 ~sh sparc x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""
RESTRICT="mirror"

src_unpack() {
	debug-print-function ${FUNCNAME} "$@"

	local f
	for f in ${A}; do
		case ${f} in
			*.xpi)
				echo ">>> Unpacking "${DISTDIR}/${f}" to ${PWD}"
				unzip -qoj ${DISTDIR}/${f}
				assert "failed unpacking ${DISTDIR}/${f}"
				;;
			*) unpack ${f} ;;
		esac
	done
}

