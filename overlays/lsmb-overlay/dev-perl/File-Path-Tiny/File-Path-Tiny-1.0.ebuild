# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="DMUEY"
DIST_VERSION="1.0"

inherit perl-module

DESCRIPTION="recursive versions of mkdir() and rmdir() without as much overhead as File::Path"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Test-Exception
	dev-lang/perl"
