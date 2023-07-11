# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v3

EAPI=8

PYTHON_COMPAT=( python3_{7..10} )
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
inherit python-single-r1 xdg-utils

DESCRIPTION="IPTV player with EPG support (Astroncia IPTV fork)"
HOMEPAGE="https://github.com/yuki-iptv/yuki-iptv"
SRC_URI="https://github.com/yuki-iptv/yuki-iptv/archive/refs/tags/${PV}.tar.gz -> yuki-iptv-${PV}.tar.gz"

LICENSE="MIT CC-BY-4.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="${PYTHON_DEPS} media-video/ffmpeg media-video/mpv[libmpv] dev-python/requests dev-python/chardet dev-python/setproctitle dev-python/PyQt5[widgets] dev-python/pillow dev-python/pygobject dev-python/unidecode dev-python/pydbus"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND} sys-devel/gettext sys-apps/findutils"

src_install() {
	while read p; do
		cp -rv "$p" "$D/$p"
		find "$D/$p" -type f -exec sed -i -e "s/__DEB_VERSION__/${PV}/g" "{}" \;
	done < debian/install
}

pkg_postinst() {
	xdg_icon_cache_update
}
