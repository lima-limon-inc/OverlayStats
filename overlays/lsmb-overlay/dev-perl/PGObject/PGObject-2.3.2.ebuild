# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="EHUELS"
DIST_VERSION="2.3.2"

inherit perl-module

DESCRIPTION="A toolkit integrating intelligent PostgreSQL dbs into Perl objects"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Try-Tiny
	dev-perl/Test-Exception
	dev-perl/DBD-Pg
	dev-lang/perl"
