# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

COMMIT="eb21b2e871144a328f93c4597cc1932b43783e6a"

DESCRIPTION="High-performance on-the-fly thumbnailer for mpv "
HOMEPAGE="https://github.com/po5/thumbfast"
SRC_URI="https://github.com/po5/${PN}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

IUSE="+autoload"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	media-video/mpv:=
	net-misc/socat
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}-${COMMIT}"

src_install() {
	MPV_INSTALL_DIR="/usr/$(get_libdir)/mpv/${PN}"
	insinto "${MPV_INSTALL_DIR}"
	doins thumbfast.lua
	if use autoload; then
   		dosym "${MPV_INSTALL_DIR}/thumbfast.lua" "/etc/mpv/scripts/thumbfast.lua"
	fi
}

pkg_postinst() {
	MPV_INSTALL_DIR="/usr/$(get_libdir)/mpv/${PN}"
	if ! use autoload; then
		elog
		elog "The plugin files have not been installed to /etc/mpv for autoloading."
		elog "Activate the autoload use flag. If you want them autoloaded."
		elog "If you want to manually configure them they're located in ${MPV_INSTALL_DIR}."
		elog
	fi
}
