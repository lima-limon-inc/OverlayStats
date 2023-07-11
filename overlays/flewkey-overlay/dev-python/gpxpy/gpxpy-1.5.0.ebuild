# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/tkrajina/gpxpy.git"
else
	SRC_URI="https://github.com/tkrajina/gpxpy/archive/v${PV}.tar.gz  -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="GPX file parser and GPS track manipulation library"
HOMEPAGE="https://github.com/tkrajina/gpxpy"
LICENSE="Apache-2.0"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
