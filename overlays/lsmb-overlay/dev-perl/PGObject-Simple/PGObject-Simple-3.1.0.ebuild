# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="EHUELS"
DIST_VERSION="3.1.0"

inherit perl-module

DESCRIPTION="Minimalist stored procedure mapper based on LedgerSMB's DBObject"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-perl/PGObject-2.000001
	dev-lang/perl"
