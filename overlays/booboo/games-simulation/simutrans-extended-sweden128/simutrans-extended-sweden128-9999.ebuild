# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit eutils git-r3

EGIT_REPO_URI='https://github.com/VictorErik/Pak128.Sweden-Ex.git'

DESCRIPTION="Sweden pakset for Simutrans Extended"
HOMEPAGE="http://www.simutrans.com/"
SRC_URI=""

LICENSE="Artistic"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="=games-simulation/simutrans-extended-9999"
RDEPEND=""

src_compile()
{
	mkdir destdir
	emake MAKEOBJ=/usr/libexec/simutrans-extended-9999/makeobj-extended DESTDIR=destdir
}

src_install()
{
	insinto /usr/share/simutrans-extended-9999
	cd destdir
	doins -r pak128.Sweden-Ex || die "doins failed"
}

