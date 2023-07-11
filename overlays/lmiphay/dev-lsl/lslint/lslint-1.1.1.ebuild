# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils

DESCRIPTION="A tool to check the validity of Second Life LSL scripts"
HOMEPAGE="http://w-hat.com/#lslint"
SRC_URI="https://github.com/Makopo/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
"
DEPEND="
	${RDEPEND}
"

DOCS="README.md"

src_prepare() {
	sed -i -e 's:CXX = g++ -g -Wall -std=c++98 -pedantic-errors -fno-omit-frame-pointer -ffloat-store:MYCXXFLAGS = -Wall -std=c++98 -pedantic-errors:' Makefile
	sed -i -e 's:CXX += -arch i386 -arch ppc::' Makefile
	sed -i -e 's:CXX += -arch i386::' Makefile
	sed -i -e 's:g++:$(CXX):' Makefile
	sed -i -e 's:$(CXX) $(CXXFLAGS):$(CXX) $(CXXFLAGS) $(MYCXXFLAGS):' Makefile

	sed -i -e 's:$(LD) $(LDFLAGS):$(CXX) $(LDFLAGS):' Makefile

	eapply_user
}

src_install() {
	dobin ${PN}
	einstalldocs
}
