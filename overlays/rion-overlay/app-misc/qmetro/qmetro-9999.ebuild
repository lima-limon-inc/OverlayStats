# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

case $PV in *9999*) VCS_ECLASS="git-r3" ;; *) VCS_ECLASS="" ;; esac

inherit qmake-utils ${VCS_ECLASS}

DESCRIPTION="Metro/subway map and route computation software."
HOMEPAGE="https://sourceforge.net/projects/qmetro/"

if [ -n "${VCS_ECLASS}" ]; then
	KEYWORDS=""
	EGIT_REPO_URI="https://git.code.sf.net/p/qmetro/git"
else
	KEYWORDS="~amd64 ~x86"
	SRC_URI="mirror://sourceforge/${PN}/${P}.zip"
fi

LICENSE="GPL-2"
SLOT="0"

RDEPEND="
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
"
DEPEND="${RDEPEND}
	app-arch/unzip
"

DOCS="AUTHORS README"

src_prepare() {
	default

	sed -i -e '/QT -= network/d' \
		-e '/src\/zlib\/zlib.h \\/d' \
		-e '/src\/zlib\/zconf.h \\/d' \
		-e '/INCLUDEPATH += src\/zlib/d' \
		rc/module/main.pri || die

	echo "LIBS += -lz" >> rc/module/main.pri
	sed -i -e 's,const crc_t,const z_crc_t,g' src/zip/zip_p.h || die
	sed -i -e 's,src/zlib/,,' src/zip/zip.h src/zip/unzip.h || die
	rm -r src/zlib/ || die

	# author seems to be an idiot. install to tmp???
	sed -i -e 's,DATADIR = /tmp/$$APPNAME,DATADIR = /usr/share/$$APPNAME,' \
		rc/platform/nix.pri || die

	eqmake5
}

src_install() {
	emake install INSTALL_ROOT="${D}"
}
