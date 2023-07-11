# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PLOCALES="cs da de en eo es fa fi fr gl he hu ie it ja ko lt nb nl pl pt pt_BR ru sk sv tr uk zh_CN"

inherit meson git-r3 plocale

DESCRIPTION="Ncurses client for the Music Player Daemon (MPD)"
HOMEPAGE="https://www.musicpd.org/clients/ncmpc/ https://github.com/MusicPlayerDaemon/ncmpc"
EGIT_REPO_URI="https://github.com/MusicPlayerDaemon/${PN}.git" 

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE="async-connect chat-screen doc +help-screen key-screen +library-screen lirc lyrics-screen +mouse nls outputs-screen pcre search-screen +song-screen"

BDEPEND="
	virtual/pkgconfig
	doc? ( dev-python/sphinx )
"
RDEPEND="
	>=media-libs/libmpdclient-2.9
	sys-libs/ncurses:=[unicode(+)]
	lirc? ( app-misc/lirc )
	pcre? ( dev-libs/libpcre2 )
"
DEPEND="${RDEPEND}"

src_prepare() {
	default

	# use correct docdir and don't install license file
	sed -e "/^docdir =/s/meson.project_name()/'${PF}'/" \
		-e "s/'COPYING', //" \
		-i meson.build || die

	# use correct (html) docdir
	sed -e "/install_dir:.*doc/s/meson.project_name()/'${PF}'/" \
		-i doc/meson.build || die

	rm_locale() {
		rm -vf "po/${1}.po" || die
		sed -i "/${1}/d" po/LINGUAS || die "removing of ${1}.po failed"
	}
	plocale_find_changes "po" "" ".po"
	plocale_for_each_disabled_locale rm_locale
}

src_configure() {
	local emesonargs=(
		-Dcurses=ncursesw
		-Dcolors=true
		-Dmini=false
		-Dlyrics_plugin_dir="${EPREFIX}/usr/$(get_libdir)/ncmpc/lyrics"
		-Dasync_connect=$(usex async-connect true false)
		-Dchat_screen=$(usex chat-screen true false)
		-Ddocumentation=$(usex doc enabled disabled)
		-Dhelp_screen=$(usex help-screen true false)
		-Dkey_screen=$(usex key-screen true false)
		-Dlibrary_screen=$(usex library-screen true false)
		-Dlirc=$(usex lirc enabled disabled)
		-Dlocale=$(usex nls enabled disabled)
		-Dlyrics_screen=$(usex lyrics-screen true false)
		-Dmouse=$(usex mouse enabled disabled)
		-Dmultibyte=$(usex nls true false)
		-Dnls=$(usex nls enabled disabled)
		-Doutputs_screen=$(usex outputs-screen true false)
		-Dregex=$(usex pcre enabled disabled)
		-Dsearch_screen=$(usex search-screen true false)
		-Dsong_screen=$(usex song-screen true false)
	)

	meson_src_configure
}
