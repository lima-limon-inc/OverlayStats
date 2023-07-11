# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Really Awesome New Cisco confIg Differ"
HOMEPAGE="https://shrubbery.net/rancid/"
SRC_URI="https://shrubbery.net/pub/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	acct-group/rancid
	acct-user/rancid
	dev-tcltk/expect
	net-misc/iputils
	net-misc/openssh
	|| ( net-misc/netkit-telnetd net-misc/telnet-bsd )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local myeconfargs=(
		--localstatedir="/var/lib/${PN}"
		--sysconfdir="/etc/${PN}"
	)
	econf "${myeconfargs[@]}"
}

src_install() {
	default

	insinto "/etc/cron.d/"
	newins "${FILESDIR}/${PN}-cron" "${PN}"
}

pkg_postinst() {
	optfeature "cvs" dev-vcs/cvs
	optfeature "git" dev-vcs/git
	optfeature "subversion" dev-vcs/subversion
}
