# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DIST_AUTHOR="ASH"
inherit perl-module

DESCRIPTION="provide a nicer syntax and method to catch errors in Perl"

#LICENSE="|| ( Artistic GPL-1+ )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-perl/Devel-Declare
	dev-perl/Test-Exception
	dev-perl/B-Hooks-OP-PPAddr
	dev-perl/Module-Install
	dev-perl/Sub-Name
	dev-perl/Parse-Method-Signatures
	dev-perl/Scope-Upper
	dev-perl/Sub-Exporter
	dev-perl/Variable-Magic
	virtual/perl-XSLoader
"
DEPEND="${RDEPEND}"
