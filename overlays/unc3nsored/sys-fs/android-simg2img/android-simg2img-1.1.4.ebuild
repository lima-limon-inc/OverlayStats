# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Tool to convert Android sparse images to raw images"
HOMEPAGE="https://github.com/anestisb/android-simg2img"
SRC_URI="https://github.com/anestisb/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	sys-libs/zlib
"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS="
	README.md
	OWNERS
"

src_prepare() {
	sed -i -e 's/-Werror//g' Makefile

	eapply_user
}

src_install() {
	emake PREFIX="${D}/usr" install

	einstalldocs
}
