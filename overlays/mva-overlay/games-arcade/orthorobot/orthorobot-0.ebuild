# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit wrapper desktop

DESCRIPTION="Nice perspective based puzzle game. You flatten the view to move across gaps"
HOMEPAGE="http://stabyourself.net/orthorobot/"
SRC_URI="http://stabyourself.net/dl.php?file=${PN}/${PN}-source.zip -> ${P}.zip"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

DEPEND=">=games-engines/love-0.8.0:*"
RDEPEND="${DEPEND}"
BDEPEND="app-arch/unzip"

S="${WORKDIR}"

src_unpack() {
	default
	#it is only one .love file (but with crappy name), so we can use asterisk
	mv *.love "${P}.zip"
	unpack "./${P}.zip"
	rm "${P}.zip"
}

src_prepare() {
	default
}

src_install() {
	local dir="/usr/share/games/love/${PN}"
	insinto "${dir}"
	doins -r .
	make_wrapper "${PN}" "love /usr/share/games/love/${PN}"
	make_desktop_entry "${PN}"
}

pkg_postinst() {
	elog "${PN} savegames and configurations are stored in:"
	elog "~/.local/share/love/${PN}/"
}
