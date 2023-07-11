# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# TODO: Add USE flags for pythonqt & rtmidi

EAPI=8

inherit qmake-utils xdg

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/CsoundQt/CsoundQt/archive/v${PV}.tar.gz  -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	MY_PN="CsoundQt"
	MY_P="${MY_PN}-${PV}"
	S="${WORKDIR}/${MY_P}"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/CsoundQt/CsoundQt.git"
fi

DESCRIPTION="The default frontend for Csound"
HOMEPAGE="https://csoundqt.github.io/"
LICENSE="LGPL-2.1"
SLOT="0"

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtwidgets:5
	media-libs/libsndfile
	media-sound/csound
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i "s/build64:LCSOUND = -lcsound64/build64:LCSOUND = -lcsound/" qcs-unix.pro
}

src_configure() {
	default
	eqmake5 qcs.pro CSOUND_API_INCLUDE_DIR=/usr/include/csound \
		CSOUND_LIBRARY_DIR="/usr/$(get_libdir)" \
		CSOUND_LIB=libcsound.so LCSOUND=-lcsound \
		INSTALL_DIR="/usr" SHARE_DIR="/usr/share"
}

src_install() {
	emake install INSTALL_ROOT="${D}"
}
