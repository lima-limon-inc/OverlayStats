# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="DNS Performance Testing Tools"
HOMEPAGE="https://www.dns-oarc.net/tools/dnsperf"
SRC_URI="https://www.dns-oarc.net/files/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/openssl
	dev-libs/concurrencykit
	net-libs/ldns
	net-libs/nghttp2
"
RDEPEND="${DEPEND}"
BDEPEND=""
