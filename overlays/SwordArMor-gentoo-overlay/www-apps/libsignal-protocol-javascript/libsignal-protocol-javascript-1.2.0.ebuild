# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit webapp

DESCRIPTION="Signal Protocol library for JavaScript"
HOMEPAGE="https://signal.org/fr/"
MY_GITHUB_AUTHOR="signalapp"
SRC_URI="https://github.com/${MY_GITHUB_AUTHOR}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	webapp_src_preinst

	dodoc README.md
	rm -f README.md

	insinto "${MY_HTDOCSDIR}/"
	doins -r .

	webapp_src_install
}
