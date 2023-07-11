# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN=slack-fortunes-all

DESCRIPTION="This fortune mod is a collection of quotes seen on AOLS (Slackware)"
HOMEPAGE="https://web.archive.org/web/20160307020349/http://fauxascii.com/linux/mod_quotes.html"
SRC_URI="https://web.archive.org/web/20160325174717if_/http://fauxascii.com/linux/data/slack-fortunes-all-1.15.tgz"
S="${WORKDIR}"
LICENSE="GPL-2 fairuse"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~m68k ~mips ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-solaris"
IUSE="offensive"

RDEPEND="games-misc/fortune-mod"
BDEPEND="${RDEPEND}"

pkg_setup() {
	if ! use offensive ; then
		elog "These fortunes have offensive content. Enable offensive USE Flag"
		elog "ex: USE=\"offensive\" emerge ${PN}"
		elog " or add to package.use file: games-misc/fortune-mod-slackware offensive"
		die "Setting the offensive use flag is required for this package"
	fi
}

src_prepare() {
	# get rid of md5 checks and extraneous files and backups
	rm -f index.* *.md5 *~ *.dat
	eapply_user
	mkdir html || die
	mv *.htm* html/ || die
}

src_compile() {
	for f in slack-fortunes-vol* ; do
		strfile "${f}" || die
	done
}

src_install() {
	dodoc -r html
	docompress -x "/usr/share/doc/${P}/html"
	insinto /usr/share/fortune/off
	doins slack-fortunes-vol-*
}
