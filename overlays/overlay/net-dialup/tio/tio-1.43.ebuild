# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson bash-completion-r1

DESCRIPTION="Simple TTY terminal application"
HOMEPAGE="https://tio.github.io/"
SRC_URI="
	https://github.com/${PN}/${PN}/releases/download/v${PV}/${P}.tar.xz
	https://github.com/benhoyt/inih/archive/refs/tags/r56.tar.gz -> inih-r56.tar.gz
"

SLOT="0"
LICENSE="GPL-2+"
KEYWORDS="~amd64 ~arm64 ~x86"

src_unpack() {
	default

	mv inih-r56 ${S}/subprojects/libinih
}

src_configure() {
	local emesonargs=(
		-Dbashcompletiondir="$(get_bashcompdir)"
	)

	meson_src_configure
}
