# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Service for net-misc/dhcp"
HOMEPAGE="http://powerman.name/RTFM/runit.html"
SRC_URI="http://powerman.name/download/Gentoo/${P}.tgz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	runit-service/setupservices
	net-misc/socat
	net-misc/dhcp
	"

src_install() {
	if [ "${ARCH}" = "amd64" ]; then
		ln -s lib service/dhcpd/root/lib64
		mv service/dhcpd/root/lib/ld-linux{,-x86-64}.so.2
	fi
	cp -a * "${D}"
}

pkg_postinst() {
	chown nobody:nobody /service/dhcpd/root/var/run/dhcp/
	chown nobody:nobody /service/dhcpd/root/var/lib/dhcp/
}
