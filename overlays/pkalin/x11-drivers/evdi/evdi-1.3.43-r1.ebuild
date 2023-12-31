# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit linux-mod

DESCRIPTION="Extensible Virtual Display Interface"
HOMEPAGE="https://github.com/DisplayLink/evdi"
SRC_URI="https://github.com/DisplayLink/evdi/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="x11-libs/libdrm
	sys-kernel/linux-headers"
RDEPEND="x11-libs/libdrm"

MODULE_NAMES="evdi(video:${S}/module)"

CONFIG_CHECK="~FB_VIRTUAL ~!INTEL_IOMMU"

pkg_setup() {
	linux-mod_pkg_setup
}

src_prepare() {
	epatch "${FILESDIR}/${P}-linux-4.11.0.patch"

	default
}

src_compile() {
	linux-mod_src_compile
	cd "${S}/library"
	default
	mv libevdi.so libevdi.so.0
}

src_install() {
	linux-mod_src_install
	dolib.so library/libevdi.so.0
	dosym libevdi.so.0 "/usr/$(get_libdir)/libevdi.so"
}
