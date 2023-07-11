# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Web GUI for AS-Stats"
HOMEPAGE="https://github.com/nidebr/as-stats-gui"
MY_GITHUB_AUTHOR="nidebr"
SRC_URI="https://github.com/${MY_GITHUB_AUTHOR}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	acct-group/as-stats
	acct-user/as-stats
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	default

	rm LICENSE
	rm README.md

	insinto "/usr/share/${PN}"
	doins -r "${S}"/*
	fowners -R "as-stats" "/usr/share/${PN}"
}
