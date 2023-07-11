# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="EINHVERFR"
DIST_VERSION="1"

inherit perl-module

DESCRIPTION="Composite Type handler for PGObject"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-perl/PGObject-Util-PseudoCSV-2
	dev-perl/PGObject-Util-Catalog-Types
	dev-perl/DBI
	dev-lang/perl"
