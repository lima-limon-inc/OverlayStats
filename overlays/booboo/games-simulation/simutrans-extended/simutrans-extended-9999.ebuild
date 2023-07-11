# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-simulation/simutrans/simutrans-0.102.2.2.ebuild,v 1.5 2012/03/23 20:14:06 tupone Exp $

EAPI=7
inherit flag-o-matic eutils git-r3

EGIT_REPO_URI='https://github.com/jamespetts/simutrans-extended.git'

DESCRIPTION="A free Transport Tycoon clone Extended version."
HOMEPAGE="http://www.simutrans.com/"
SRC_URI=""

LICENSE="Artistic"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND="media-libs/libsdl2[sound,video]
	sys-libs/zlib
	media-libs/libpng
	media-libs/sdl2-mixer"
DEPEND="${RDEPEND}"
PDEPEND="|| ( games-simulation/simutrans-extended-britain128
	games-simulation/simutrans-extended-sweden128 ) "

DOCS="documentation/*
todo.txt"

src_unpack() {
	git-r3_src_unpack
}

src_prepare() {
	strip-flags # bug #293927
	echo "BACKEND=sdl2
COLOUR_DEPTH=16
OSTYPE=linux
MULTI_THREAD=1
FLAGS += -fno-delete-null-pointer-checks -fno-strict-aliasing -std=c++11" > config.default \
	|| die "echo failed"

	if use amd64; then
		echo "FLAGS+=-DUSE_C" >> config.default
	fi

	if use debug; then
		echo "DEBUG=3" >> config.default
	else
		echo "OPTIMISE=1" >> config.default
	fi

	# make it look in the install location for the data
	sed -i \
		-e "s:argv\[0\]:\"/usr/share/${PF}/\":" \
		simmain.cc \
		|| die "sed failed"

	# Please don't override our CFLAGS, kthx
	sed -i \
		-e '/-O$/d' \
		Makefile \
		|| die "sed failed"

	rm -f simutrans/{simutrans,nettool,simexstrip,simutrans-experimental,simutrans-experimental-10.15,simutrans-experimental-32,simutrans-extended,nettool/nettool}

	eapply_user
}

src_compile() {
	emake || die
	cd ${S}/makeobj && emake || die
	cd ${S}/nettools && emake || die
}

src_install() {
	dobin build/default/{simutrans-extended,nettool/nettool} || die "dobin failed"


	exeinto /usr/libexec/${PF}
	doexe build/default/makeobj-extended/makeobj-extended || die "doexe failed"

	insinto /usr/share/${PF}
	doins -r simutrans/* || die "doins failed"
	#dodoc documentation/* todo.txt
	doicon simutrans.ico
	make_desktop_entry simutrans Simutrans /usr/share/pixmaps/simutrans.ico
}
