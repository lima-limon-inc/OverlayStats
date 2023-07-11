# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MYPV="$(ver_rs 2 -)"

inherit R-packages

DESCRIPTION="Bootstrap Functions (Originally by Angelo Canty for S)"
SRC_URI="mirror://cran/src/contrib/${PN}_${MYPV}.tar.gz"

KEYWORDS="~amd64"
LICENSE='public-domain'

DEPEND="
	>=dev-lang/R-3.0.0
	!dev-lang/R[-minimal]
"
RDEPEND="${DEPEND}"

SUGGESTED_PACKAGES="
	virtual/MASS
	virtual/survival
"
