# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Dynamic DNS Connector for NetBox"
HOMEPAGE="https://github.com/sjm-steffann/netbox-ddns"
SRC_URI="https://github.com/sjm-steffann/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-python/dnspython[${PYTHON_USEDEP}]
	www-apps/netbox
"
RDEPEND="${DEPEND}"
BDEPEND=""
