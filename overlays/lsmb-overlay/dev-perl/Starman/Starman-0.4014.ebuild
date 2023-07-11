# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="MIYAGAWA"
DIST_VERSION="0.4014"

inherit perl-module

DESCRIPTION="Plack::Handler::Starman - Plack adapter for Starman"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Test-Requires
	dev-perl/Net-Server
	dev-perl/Module-Build
	dev-perl/HTTP-Date
	>=dev-perl/Module-Build-Tiny-0.39.0
	dev-perl/libwww-perl
	>=dev-perl/Test-TCP-2.170.0
	>=dev-perl/Plack-1.4.300
	dev-perl/HTTP-Message
	dev-perl/Data-Dump
	dev-perl/HTTP-Parser-XS
	dev-lang/perl"
