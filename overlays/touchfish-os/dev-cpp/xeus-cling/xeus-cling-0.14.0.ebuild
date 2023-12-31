# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Jupyter kernel for the C++ programming language"
HOMEPAGE="https://github.com/jupyter-xeus/xeus-cling"
SRC_URI="https://github.com/jupyter-xeus/xeus-cling/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS=""
IUSE=""
RESTRICT="mirror"

DEPEND="
	>=dev-cpp/xeus-zmq-1.0.0
	<dev-cpp/xeus-zmq-2.0.0
	>=dev-cpp/xtl-0.7.0
	<dev-cpp/xtl-0.8.0
	dev-cpp/cling
	>=dev-libs/pugixml-1.8.1
	>=net-libs/cppzmq-4.3.0
	>=dev-libs/cxxopts-2.1.1
	>=dev-cpp/nlohmann_json-3.6.1"
#	<=dev-libs/cxxopts-2.2
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	mycmakeargs=(
		-DCMAKE_PROGRAM_PATH=/opt/cling/bin
	)
	cmake_src_configure
}
