# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A Matrix-Facebook Messenger puppeting bridge."
HOMEPAGE="https://github.com/mautrix/facebook"
SRC_URI="https://github.com/mautrix/facebook/archive/refs/tags/v${PV}.tar.gz"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

PYTHON_COMPAT=( python3_{8,9,10} )
inherit distutils-r1

PATCHES=(
	"${FILESDIR}/example_config_bypass_distutils-${PV}.patch"
)

S="${WORKDIR}/facebook-${PV}"

DEPEND=""
RDEPEND="
	>=dev-python/aiohttp-3.0.0
	<dev-python/aiohttp-4.0.0
	>=dev-python/yarl-1.0.0
	<dev-python/yarl-2.0.0
	>=dev-python/asyncpg-0.20.0
	<dev-python/asyncpg-0.26.0
	>=dev-python/ruamel-yaml-0.15.94
	<dev-python/ruamel-yaml-0.18.0
	>=dev-python/commonmark-0.8.0
	<dev-python/commonmark-0.10.0
	>=dev-python/python-magic-0.4.0
	<dev-python/python-magic-0.5.0
	>=dev-python/mautrix-0.15.4
	<dev-python/mautrix-0.16.0
	>=dev-python/pycryptodome-3.0.0
	<dev-python/pycryptodome-4.0.0
	>=dev-python/paho-mqtt-1.5.0
	<dev-python/paho-mqtt-2.0.0
	dev-python/python-zstandard
	acct-user/mautrix-facebook
	"
BDEPEND=""

src_install() {
	distutils-r1_src_install
	insinto "/etc/${PN}"
	doins mautrix_facebook/example-config.yaml

	newconfd "${FILESDIR}/mautrix-facebook.confd" mautrix-facebook
	newinitd "${FILESDIR}/mautrix-facebook.initd" mautrix-facebook
}
