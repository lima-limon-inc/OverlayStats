# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit perl-module git-r3

DESCRIPTION="IP to ASN mapping"
EGIT_REPO_URI="https://github.com/JackSlateur/perl-ip2as.git"

#LICENSE="|| ( Artistic GPL-1+ )"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	dev-perl/JSON-XS
	dev-perl/Net-Patricia
"
DEPEND="${RDEPEND}"

DOCS=( README.md tools/{asinfo.txt,ip2asn.json} )

src_prepare() {
	default
	perl_set_version
}

src_install() {
	default

	insinto "${VENDOR_LIB}"
	doins ip2as.pm

	insinto "/usr/libexec/${PN}"
	doins tools/fetch_ip_asn.py
}
