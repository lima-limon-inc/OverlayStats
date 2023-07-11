# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="DMUEY"
DIST_VERSION="0.6"

inherit perl-module

DESCRIPTION="Check @INC once for modules that you want but may not have"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Module-Build
	dev-perl/File-Path-Tiny
	dev-perl/Test-Carp
	dev-lang/perl"
