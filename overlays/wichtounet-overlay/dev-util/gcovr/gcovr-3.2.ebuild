# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Gcovr provides a utility for managing the use of the GNU gcov utility and generating summarized code coverage results"
HOMEPAGE="https://github.com/gcovr/gcovr"
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
SRC_URI="https://raw.githubusercontent.com/gcovr/gcovr/34f2b575c87c9d6c656abfeb3c7bec4f2d235aa4/scripts/gcovr"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin ${DISTDIR}/gcovr || die "Failed to install gcovr"
}
