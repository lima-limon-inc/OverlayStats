# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR="JMGDOC"
DIST_VERSION="2.125"

inherit perl-module

DESCRIPTION="The Perl Open OpenDocument Connector"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-perl/XML-Twig-3.520.0
	>=dev-perl/Archive-Zip-1.590.0
	dev-lang/perl"
