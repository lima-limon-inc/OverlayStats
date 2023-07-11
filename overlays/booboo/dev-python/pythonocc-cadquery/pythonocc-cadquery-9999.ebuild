# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

PYTHON_COMPAT=( python3_{5..11} )

inherit distutils-r1 cmake

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/CadQuery/pythonocc-core"
else
	MY_PN=pythonocc-core
	MY_P=${MY_PN}-${PV}
	SRC_URI="https://github.com/CadQuery/pythonocc-core/archive/${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${MY_P}/"
fi

DESCRIPTION="Python Interface to OpenCASCADE CAD library, CadQuery fork"
HOMEPAGE="https://github.com/CadQuery/pythonocc-core"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="sci-libs/oce
	>=dev-lang/swig-2.0.10
	>=dev-util/cmake-2.8
	>=sci-libs/opencascade-7.4.0
"
DEPEND="${RDEPEND}
	dev-lang/swig"
