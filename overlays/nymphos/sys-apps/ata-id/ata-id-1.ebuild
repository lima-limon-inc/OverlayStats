# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Reads product/serial number from ATA drives"
HOMEPAGE="https://www.freedesktop.org/wiki/Software/systemd"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64"

DEPEND="sys-kernel/linux-headers"

S="${WORKDIR}"

src_compile() {
	"$(tc-getCC)" "${FILESDIR}/${PN}.c" -o "${PN}"
}

src_install() {
	dobin "${PN}"
}
