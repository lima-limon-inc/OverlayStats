# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# Kids, don't do this at home!
inherit python-utils-r1
PYTHON_COMPAT=( "${_PYTHON_ALL_IMPLS[@]}" )

inherit autotools-utils python-r1

DESCRIPTION="Python script wrapper"
HOMEPAGE="https://bitbucket.org/mgorny/python-exec/"
SRC_URI="https://www.bitbucket.org/mgorny/${PN}/downloads/${P}.tar.bz2"

LICENSE="BSD-2"
SLOT="2"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="!<dev-python/python-exec-10000"

src_configure() {
	local pyimpls i EPYTHON
	for i in "${PYTHON_COMPAT[@]}"; do
		python_export "${i}" EPYTHON
		pyimpls+=" ${EPYTHON}"
	done

	local myeconfargs=(
		--with-eprefix="${EPREFIX}"
		--with-python-impls="${pyimpls}"
	)

	autotools-utils_src_configure
}
