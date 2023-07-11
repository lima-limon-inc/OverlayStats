# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit perl-module

DESCRIPTION="Perl lib for IXP-Manager"
HOMEPAGE="https://github.com/inex/IXP-Manager/tree/master/tools/perl-lib/IXPManager"
SRC_URI="https://github.com/inex/IXP-Manager/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=""
DEPEND="${RDEPEND}"

src_unpack() {
	default
	mv "${WORKDIR}/IXP-Manager-${PV}/tools/perl-lib/IXPManager" "${S}"
}

src_install() {
	default
	dodoc ixpmanager.conf.dist
}
