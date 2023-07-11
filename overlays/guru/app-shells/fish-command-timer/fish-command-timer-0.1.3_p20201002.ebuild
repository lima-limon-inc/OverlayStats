# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
COMMIT="d84332e56e9ad4fe8d2f1fe80dedbed50449979c"

DESCRIPTION="Fish shell extension for printing execution time for each command"
HOMEPAGE="https://github.com/jichu4n/fish-command-timer"
SRC_URI="https://github.com/jichu4n/fish-command-timer/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND=">=app-shells/fish-2.2"

S="${WORKDIR}/${PN}-${COMMIT}"
DOCS=( README.md )

src_install() {
	insinto "/usr/share/fish/vendor_conf.d"
	doins "conf.d/fish_command_timer.fish"
	einstalldocs
}
