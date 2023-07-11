# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DIST_AUTHOR=NEILB
DIST_VERSION=${PV}
inherit perl-module

DESCRIPTION="Update file access and modification times, creating files if needed"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"
SRC_TEST="do"
