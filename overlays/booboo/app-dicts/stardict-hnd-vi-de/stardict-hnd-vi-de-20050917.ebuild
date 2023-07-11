# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

FROM_LANG="Vietnamese"
TO_LANG="German"

inherit stardict

HOMEPAGE="https://sourceforge.net/projects/ovdp/"
SRC_URI="http://ftp.gunadarma.ac.id/mirrors/gentoo/distfiles/VietDuc12K.zip"

KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"

S=${WORKDIR}/VietDuc
