# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# This ebuild generated by g-cpan 0.17.0

EAPI=8

DIST_AUTHOR="PREACTION"
DIST_VERSION="1.025"

inherit perl-module

DESCRIPTION="Lightweight Dependency Injection Container"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Moo
	dev-perl/JSON
	dev-perl/Module-Runtime
	>=dev-perl/Data-DPath-0.58
	>=dev-perl/Config-Any-0.320.0
	dev-perl/Beam-Emitter
	>=dev-perl/Test-Differences-0.680.0
	dev-perl/YAML
	dev-perl/Test-Lib
	dev-perl/Test-Deep
	dev-perl/Type-Tiny
	dev-perl/Beam-Service
	>=dev-perl/Path-Tiny-0.120.0
	dev-perl/Throwable
	dev-perl/Test-Exception
	dev-lang/perl"