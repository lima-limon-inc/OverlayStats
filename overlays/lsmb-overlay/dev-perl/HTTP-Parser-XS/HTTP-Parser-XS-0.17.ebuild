# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="KAZUHO"
DIST_VERSION="0.17"

inherit perl-module

DESCRIPTION="a fast, primitive HTTP request parser"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/perl
dev-perl/Module-Install"
