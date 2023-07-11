# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit cmake git-r3

EGIT_REPO_URI="https://github.com/vayerx/fdedup.git"

if [[ "${PV}" = 9999* ]]; then
	KEYWORDS=""
else
	EGIT_COMMIT="amd64-${PV}"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Yet another file deduplicator"
HOMEPAGE="https://github.com/vayerx/fdedup"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
	>=dev-libs/boost-1.65:=
"
DEPEND="${RDEPEND}"

src_prepare() {
    cmake_src_prepare
}

src_configure() {
    cmake_src_configure
}
