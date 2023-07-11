# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="tmate SSH server"
HOMEPAGE="https://github.com/tmate-io/tmate-ssh-server"
SRC_URI="https://github.com/tmate-io/${PN}/archive/refs/tags/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/libevent
	dev-libs/msgpack
	dev-libs/openssl:0=
	net-libs/libssh[server]
	sys-libs/libutempter
	sys-libs/ncurses
	sys-libs/zlib
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
	mv create_keys.sh "${PN}-create_keys.sh"
}

src_install() {
	default

	dobin "${PN}-create_keys.sh"
}
