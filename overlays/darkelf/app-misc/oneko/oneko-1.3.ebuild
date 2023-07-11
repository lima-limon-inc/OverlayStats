# taken from gentoo portage tree
# updated manually by Simon the Sorcerer

EAPI=7
inherit eutils toolchain-funcs

DESCRIPTION="A cat, dog and others which chase the mouse or windows around the screen"
HOMEPAGE="http://homepages.uni-paderborn.de/neuron/oneko/"
SRC_URI="http://homepages.uni-paderborn.de/neuron/oneko/${P}.txz
	http://homepages.uni-paderborn.de/neuron/oneko/oneko-cat.png
	http://homepages.uni-paderborn.de/neuron/oneko/oneko-dog.png
	http://homepages.uni-paderborn.de/neuron/oneko/oneko-tora.png
	http://homepages.uni-paderborn.de/neuron/oneko/oneko-sakura.png
	http://homepages.uni-paderborn.de/neuron/oneko/oneko-kill-cat.png"

LICENSE="Artistic bsd-daemon? ( bsd-daemon-copyright )"
SLOT="0"
KEYWORDS="amd64 ~ppc ~ppc64 ~x86"
IUSE="-bsd-daemon"
RDEPEND="
	x11-libs/libX11
	x11-libs/libXext
"
DEPEND="
	${RDEPEND}
	x11-misc/gccmakedep
	x11-misc/imake
	app-text/rman
	x11-base/xorg-proto
"

S=${WORKDIR}/oneko-${PV}

src_prepare() {
	eapply_user
	if use !bsd-daemon ; then
		eapply "${FILESDIR}"/oneko-1.3-sakura-nobsd.patch
	fi
}

src_configure() {
	xmkmf -a || die
}

src_compile() {
	emake \
		CC="$(tc-getCC)" \
		CCOPTIONS="${CFLAGS}" \
		EXTRA_LDOPTIONS="${LDFLAGS}" \
		|| die
}

src_install() {
	dobin oneko
	newman oneko._man oneko.6x
	newman oneko.man.jp oneko.jp.6x
	newman oneko.man.de oneko.de.6x
	dodoc README README-NEW README-SUPP
	newicon "${DISTDIR}/oneko-cat.png" "cat.png"
	newicon "${DISTDIR}/oneko-dog.png" "dog.png"
	newicon "${DISTDIR}/oneko-tora.png" "tora.png"
	newicon "${DISTDIR}/oneko-sakura.png" "sakura.png"
	newicon "${DISTDIR}/oneko-kill-cat.png" "kill_cat.png"
	make_desktop_entry "oneko" "oneko (cat)" "cat" "Game;Amusement"
	make_desktop_entry "oneko -dog" "oneko (dog)" "dog" "Game;Amusement"
	make_desktop_entry "oneko -tora -fg brown -bg orange" "oneko (tora)" "tora" "Game;Amusement"
	make_desktop_entry "oneko -sakura -fg Grey12 -bg DarkSalmon" "oneko (sakura)" "sakura" "Game;Amusement"
	make_desktop_entry "killall -TERM oneko" "oneko - kill" "kill_cat" "Game;Amusement"
}

pkg_postinst() {
	elog "To kill oneko, type the following in a terminal:"
	elog ""
	elog "killall oneko"
	elog ""
	elog "If your mouse cursor changes to the default black cross"
	elog "after running ${PN}, you should emerge x11-apps/xsetroot"
	elog "and run:"
	elog ""
	elog "xsetroot -cursor_name left_ptr"
	elog ""

	if use bsd-daemon ; then
		ewarn "You activated the bsd-daemon USE-Flag, be sure to use the bsd-daemon logo only according to BSD Daemon Copyright."
	fi
}
