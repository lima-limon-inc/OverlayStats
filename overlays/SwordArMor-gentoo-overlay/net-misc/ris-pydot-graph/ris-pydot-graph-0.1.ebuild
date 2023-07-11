# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit python-r1

DESCRIPTION="Draw a graph from RIS BGP data"
HOMEPAGE="https://git.grifon.fr/alarig/ris-pydot-graph"
SRC_URI="https://git.grifon.fr/alarig/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-python/cymruwhois
	dev-python/pydot
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}"

src_install() {
	default
	python_foreach_impl python_newscript ris.py "${PN}"
}
