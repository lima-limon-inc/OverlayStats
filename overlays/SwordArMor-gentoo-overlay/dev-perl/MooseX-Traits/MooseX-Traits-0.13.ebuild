# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DIST_AUTHOR="ETHER"
inherit perl-module

DESCRIPTION="Automatically apply roles at object creation time"

#LICENSE="|| ( Artistic GPL-1+ )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	virtual/perl-Carp
	dev-perl/Class-Load
	dev-perl/namespace-autoclean
	dev-perl/Sub-Exporter
"
DEPEND="${RDEPEND}"
