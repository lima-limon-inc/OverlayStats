# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="DMUEY"
DIST_VERSION="0.23"

inherit perl-module

DESCRIPTION="non-collation related unicode/utf-8 bytes string-type-agnostic utils"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Module-Build
	dev-perl/B-Flags
	>=dev-perl/Module-Want-0.6
	dev-perl/String-Unquotemeta
	dev-lang/perl"
