# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="ETHER"
DIST_VERSION="0.033"

inherit perl-module

DESCRIPTION="A LWP::UserAgent suitable for simulating and testing network calls"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Test-Fatal
	dev-perl/libwww-perl
	dev-perl/HTTP-Message
	>=dev-perl/namespace-clean-0.260.0
	dev-perl/Path-Tiny
	dev-perl/HTTP-Date
	>=dev-perl/Test-Deep-1.127.0
	dev-perl/Test-Needs
	>=dev-perl/Test-Warnings-0.26.0
	>=dev-perl/URI-1.710.0
	dev-perl/Test-RequiresInternet
	dev-perl/Safe-Isa
	dev-perl/Try-Tiny
	dev-lang/perl"
