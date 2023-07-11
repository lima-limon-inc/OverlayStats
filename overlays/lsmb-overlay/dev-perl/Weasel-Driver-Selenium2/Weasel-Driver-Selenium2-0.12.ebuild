# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="EHUELS"
DIST_VERSION="0.12"

inherit perl-module

DESCRIPTION="Weasel driver wrapping Selenium::Remote::Driver"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Selenium-Remote-Driver
	dev-perl/Moose
	>=dev-perl/Weasel-0.11
	dev-lang/perl"
