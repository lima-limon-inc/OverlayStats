# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.savannah.gnu.org/git/osip.git"
else
	SRC_URI="mirror://gnu/osip/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A simple way to support the Session Initiation Protocol"
HOMEPAGE="https://www.gnu.org/software/osip/"
LICENSE="GPL-2"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
