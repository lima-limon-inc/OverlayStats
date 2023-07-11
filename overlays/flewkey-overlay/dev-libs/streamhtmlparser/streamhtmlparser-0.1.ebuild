# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/google/streamhtmlparser.git"
else
	SRC_URI="https://github.com/google/${PN}/archive/${P}.tar.gz"
	KEYWORDS="~amd64"
	MY_P=${PN}-${P}
	S="${WORKDIR}/${MY_P}"
fi

DESCRIPTION="Scan an HTML stream and provide context"
HOMEPAGE="https://github.com/google/streamhtmlparser"
LICENSE="BSD"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
