# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
DIST_AUTHOR=GRANTM
DIST_VERSION=${PV}

inherit perl-module

DESCRIPTION="takes mixed encoding input and produces UTF-8 output"
LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"
DEPEND="
	${COMMON_DEPEND}
	dev-perl/Module-Install
	test? (
		>=virtual/perl-Test-Simple-0.01
	)
"
RDEPEND="
	${COMMON_DEPEND}
"
SRC_TEST="do"
