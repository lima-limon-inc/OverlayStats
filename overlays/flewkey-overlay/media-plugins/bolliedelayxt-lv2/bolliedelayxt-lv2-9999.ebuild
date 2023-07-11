# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/MrBollie/bolliedelayxt.lv2/archive/v${PV}.tar.gz  -> ${P}.tar.gz"
	KEYWORDS="~amd64"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/MrBollie/bolliedelayxt.lv2.git"
fi

DESCRIPTION="An LV2 delay plugin, superseding bolliedelay.lv2"
HOMEPAGE="https://github.com/MrBollie/bolliedelayxt.lv2"
LICENSE="GPL-3"
SLOT="0"

DEPEND="
	media-libs/lv2
"
RDEPEND="${DEPEND}"
BDEPEND=""
PATCHES=(
	"${FILESDIR}/prevent_stripping.patch"
)

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
	mv "${D}/usr/lib" "${D}/usr/$(get_libdir)"
}
