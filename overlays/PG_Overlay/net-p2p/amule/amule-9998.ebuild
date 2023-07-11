# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PLOCALES="ar ast bg ca cs da de el en_GB es et_EE eu fi fr gl he hr hu it it_CH ja ko_KR lt nl nn pl pt_BR pt_PT ro ru sl sq sv tr uk zh_CN zh_TW"
WX_GTK_VER="3.1-gtk3"
WANT_AUTOCONF="2.5"

inherit autotools git-r3 plocale wxwidgets xdg-utils flag-o-matic

DESCRIPTION="aMule, the all-platform eMule p2p client"
HOMEPAGE="http://www.amule.org/"
EGIT_REPO_URI="https://github.com/${PN}-project/${PN}.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE="daemon debug geoip gui +nls stats upnp X +mmap webserver"

RDEPEND="
	dev-libs/boost:=
	dev-libs/crypto++:=
	sys-libs/binutils-libs:0=
	sys-libs/readline:0=
	sys-libs/zlib
	>=x11-libs/wxGTK-3.0.4:${WX_GTK_VER}[gui?]
	daemon? ( acct-user/amule )
	geoip? ( dev-libs/geoip )
	nls? ( virtual/libintl )
	webserver? (
		acct-user/amule
		media-libs/libpng:0=
	)
	stats? ( media-libs/gd:=[jpeg,png] )
	upnp? ( net-libs/libupnp:0 )
"
DEPEND="${RDEPEND}
	X? ( dev-util/desktop-file-utils )
"
BDEPEND="
	virtual/pkgconfig
	nls? ( sys-devel/gettext )
"

PATCHES=(
	"${FILESDIR}/${PN}-2.3.2-disable-version-check.patch"
)

pkg_setup() {
	setup-wxwidgets
}

src_prepare() {
	default
	rem_locale() {
		rm "po/${1}.po" || die "removing of ${1}.po failed"
	}
	plocale_find_changes po "" ".po"
	plocale_for_each_disabled_locale rem_locale

	#pushd src/pixmaps/flags_xpm
	#./makeflags.sh
	#popd

	append-flags -DASIO_SOCKETS=1
	append-cppflags -DASIO_SOCKETS=1
	#eautoreconf
	./autogen.sh || die
}

src_configure() {
	append-flags -DASIO_SOCKETS=1
	append-cppflags -DASIO_SOCKETS=1
	local myconf=(
		--with-denoise-level=0
		--with-wx-config="${WX_CONFIG}"
		--enable-amulecmd
		--with-boost
		$(use_enable debug)
		$(use_enable daemon amule-daemon)
		$(use_enable geoip)
		$(use_enable nls)
		$(use_enable webserver)
		$(use_enable stats cas)
		$(use_enable stats alcc)
		$(use_enable upnp)
		$(use_enable mmap)
	)

	if use X; then
		myconf+=(
			$(use_enable gui amule-gui)
			$(use_enable stats alc)
			$(use_enable stats wxcas)
		)
	else
		myconf+=(
			--disable-monolithic
			--disable-amule-gui
			--disable-alc
			--disable-wxcas
		)
	fi

	econf "${myconf[@]}"
}

src_install() {
	default

	if use daemon; then
		newconfd "${FILESDIR}"/amuled.confd-r1 amuled
		newinitd "${FILESDIR}"/amuled.initd amuled
	fi
	if use webserver; then
		newconfd "${FILESDIR}"/amuleweb.confd-r1 amuleweb
		newinitd "${FILESDIR}"/amuleweb.initd amuleweb
	fi

	if use X && use gui; then
		rm ${D}/usr/bin/amule
	fi
}

pkg_postinst() {
	local ver

	if use daemon || use webserver; then
		for ver in ${REPLACING_VERSIONS}; do
			if ver_test ${ver} -lt "2.3.2-r4"; then
				elog "Default user under which amuled and amuleweb daemons are started"
				elog "have been changed from p2p to amule. Default home directory have been"
				elog "changed as well."
				echo
				elog "If you want to preserve old download/share location, you can create"
				elog "symlink /var/lib/amule/.aMule pointing to the old location and adjust"
				elog "files ownership *or* restore AMULEUSER and AMULEHOME variables in"
				elog "/etc/conf.d/{amuled,amuleweb} to the old values."

				break
			fi
		done
	fi

	use X && xdg_desktop_database_update
}

pkg_postrm() {
	use X && xdg_desktop_database_update
}
