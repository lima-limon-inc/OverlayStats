# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.sdf.org/flewkey/eselect-juce.git"
else
	SRC_URI="https://git.sdf.org/flewkey/eselect-juce/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${PN}"
fi

DESCRIPTION="JUCE eselect modules"
HOMEPAGE="https://git.sdf.org/flewkey/eselect-juce"
LICENSE="GPL-2"
SLOT="0"

DEPEND=""
RDEPEND="app-admin/eselect"
BDEPEND=""

src_compile() {
	:
}

src_install() {
	emake DESTDIR="${D}" install
}
