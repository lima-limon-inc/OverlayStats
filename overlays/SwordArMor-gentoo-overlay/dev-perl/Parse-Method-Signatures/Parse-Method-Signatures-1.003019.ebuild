# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DIST_AUTHOR="KENTNL"
inherit perl-module

DESCRIPTION="Perl6 like method signature parser"

#LICENSE="|| ( Artistic GPL-1+ )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-perl/Class-Load
	dev-perl/List-MoreUtils
	dev-perl/Moose
	dev-perl/MooseX-Types
	dev-perl/namespace-clean
	dev-perl/PPI
"
DEPEND="${RDEPEND}"
