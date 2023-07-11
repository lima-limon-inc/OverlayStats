# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="EHUELS"
DIST_VERSION="0.08"

inherit perl-module

DESCRIPTION="Easily Manage LedgerSMB Installations"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/PGObject-Util-DBMethod
	dev-perl/PGObject-Simple-Role
	dev-perl/PGObject-Util-DBAdmin
	>=dev-perl/PGObject-Util-DBChange-0.050.2
	dev-perl/Test-Exception
	dev-lang/perl"
