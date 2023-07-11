# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="TEODESIAN"
DIST_VERSION="1.47"

inherit perl-module

DESCRIPTION="Perl Client for Selenium Remote Driver"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/HTTP-Message
	dev-perl/Test-LongString
	dev-perl/Try-Tiny
	dev-perl/JSON
	dev-perl/Test-LWP-UserAgent
	dev-perl/File-Which
	dev-perl/Test-Fatal
	dev-perl/Moo
	dev-perl/libwww-perl
	dev-perl/namespace-clean
	dev-perl/IO-String
	dev-perl/Sub-Install
	dev-perl/Test-Warn
	dev-perl/Test-Time
	dev-perl/XML-Simple
	dev-perl/Archive-Zip
	dev-lang/perl"
