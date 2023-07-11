# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="display unicode character properties"
HOMEPAGE="https://tracker.debian.org/pkg/unicode"
SRC_URI="mirror://debian/pool/main/u/${PN}/${PN}_${PV}.orig.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-i18n/unicode-data"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=(README{,-paracode} debian/changelog)

src_install() {
	doman unicode.1
	distutils-r1_src_install
}
