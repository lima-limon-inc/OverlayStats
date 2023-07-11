# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="EHUELS"
DIST_VERSION="2.000002"

inherit perl-module

DESCRIPTION="DateTime Wrappers for PGObject"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/DateTime-TimeZone
	dev-perl/DateTime
	>=dev-perl/PGObject-2.000001
	dev-lang/perl"
