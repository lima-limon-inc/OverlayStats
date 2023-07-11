# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit perl-module

DESCRIPTION="Framework to write Net-SNMP extensions using pass or pass_persist mechanisms."
SRC_URI="mirror://cpan/authors/id/S/SA/SAPER/${P}.tar.gz"
HOMEPAGE="https://metacpan.org/pod/SNMP::Extension::PassPersist"

LICENSE="|| ( Artistic GPL-1+ )" # same as perl
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-perl/Module-Build
dev-perl/Class-Accessor
dev-perl/IO-String
dev-perl/Sort-Key-OID
dev-perl/List-MoreUtils"
