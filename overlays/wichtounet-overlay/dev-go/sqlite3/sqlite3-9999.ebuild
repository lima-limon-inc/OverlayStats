# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

DESCRIPTION="sqlite3 driver for Go"
HOMEPAGE="https://github.com/mattn/go-sqlite3"

inherit eutils

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-lang/go-1.1.1"

RDEPEND="${DEPEND}"

pkg_setup() {
	if [[ ! -e "${GOPATH}" ]] ; then
		eerror "The GOPATH variable must be set and point to an existing directory"
		die "The GOPATH variable must be set and point to an existing directory"
	fi
}

src_unpack() {
	#Fake the unpack
	mkdir -p ${P}
}

src_install() {
	#Fake the install
	mkdir -p ${D}
}

pkg_postinst(){
	go get github.com/mattn/go-sqlite3
}
