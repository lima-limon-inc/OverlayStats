# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="EINHVERFR"
DIST_VERSION="0.03"

inherit perl-module

DESCRIPTION="Utilities for working with Composite types"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/DBD-Pg
	dev-perl/DBI
	dev-lang/perl"
