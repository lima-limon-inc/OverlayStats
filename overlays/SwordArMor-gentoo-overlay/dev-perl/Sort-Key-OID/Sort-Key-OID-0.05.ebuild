# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit perl-module

DESCRIPTION="Module extending the Sort::Key modules family to sort OID values."
SRC_URI="mirror://cpan/authors/id/S/SA/SALVA/${P}.tar.gz"
HOMEPAGE="https://metacpan.org/pod/Sort::Key::OID"

LICENSE="|| ( Artistic GPL-1+ )" # same as perl
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-perl/Sort-Key"
