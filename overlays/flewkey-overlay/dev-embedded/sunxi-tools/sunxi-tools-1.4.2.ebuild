# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/linux-sunxi/sunxi-tools.git"
else
	SRC_URI="https://github.com/linux-sunxi/sunxi-tools/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Tools for Allwinner A10 devices"
HOMEPAGE="http://linux-sunxi.org/"
LICENSE="GPL-2"
SLOT="0"
IUSE="+extra"

DEPEND="
	virtual/libusb:1
	sys-libs/zlib
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_compile() {
	emake tools
	use extra && emake misc
}

src_install() {
	emake install-tools DESTDIR="${D}" PREFIX="/usr"
	use extra && emake install-misc DESTDIR="${D}" PREFIX="/usr"
}
