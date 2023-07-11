# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MODULE_AUTHOR="MJEVANS"
MODULE_VERSION="1.80"

inherit perl-module git-r3

DESCRIPTION="Oracle database driver for the DBI module"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-perl/DBI
	dev-lang/perl
	dev-db/oracle-instantclient"
RDEPEND="$DEPEND"

DESCRIPTION="Oracle database driver for the DBI module"

HOMEPAGE="https://github.com/perl5-dbi/DBD-Oracle"
EGIT_REPO_URI="https://github.com/perl5-dbi/${PN}.git"
EGIT_BRANCH="master"
