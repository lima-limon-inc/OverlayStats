# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="EHUELS"
DIST_VERSION="1.2.3"

inherit perl-module

DESCRIPTION="Wrapper for raw strings mapping to BYTEA columns"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/File-Slurp
	dev-perl/DBD-Pg
	>=dev-perl/PGObject-2.000001
	dev-lang/perl"
