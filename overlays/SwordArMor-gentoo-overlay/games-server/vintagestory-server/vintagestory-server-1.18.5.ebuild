# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Server for Vintage Story"
HOMEPAGE="https://www.vintagestory.at/"
SRC_URI="https://cdn.vintagestory.at/gamefiles/stable/vs_server_${PV}.tar.gz"

LICENSE="all-right-reserved"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	acct-group/vintagestory
	acct-user/vintagestory
	dev-lang/mono
	net-misc/curl
	net-misc/wget
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install() {
	insinto /opt/vintagestory-server
	doins -r *

	newinitd "${FILESDIR}"/vintagestory.initd vintagestory
}
