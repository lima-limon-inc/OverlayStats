# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-info linux-mod

DESCRIPTION="akvcam is a fully compliant V4L2 virtual camera driver for Linux"
HOMEPAGE="https://github.com/webcamoid/akvcam"

SRC_URI="https://github.com/webcamoid/akvcam/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64 x86"
S=${WORKDIR}/${PN}-${PV}

LICENSE="GPL-2"
SLOT="0"

DEPEND="virtual/linux-sources"

#test requires that the module is already loaded
RESTRICT="test"

MODULE_NAMES="akvcam(misc:${S}/src)"
BUILD_PARAMS="KERNEL_DIR=\"\${KV_OUT_DIR}\""
BUILD_TARGETS="all"

ARCH="x86"

src_install() {
	linux-mod_src_install

	local DOCS=(
		README.md
		ChangeLog
		CONTRIBUTING.md
		COPYING
		share
	)
	einstalldocs

}
