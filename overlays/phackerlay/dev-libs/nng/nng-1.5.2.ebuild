# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_ECLASS=cmake
inherit cmake-multilib

DESCRIPTION="High-performance messaging interface for distributed applications"
HOMEPAGE="https://nng.nanomsg.org/"
SRC_URI="https://github.com/nanomsg/nng/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64"
IUSE="doc"
SLOT="0"

DEPEND="doc? ( dev-ruby/asciidoctor )"


multilib_src_configure() {
	local mycmakeargs=(
		-DNN_STATIC_LIB=OFF
	)
	if multilib_is_native_abi; then
		mycmakeargs+=(
			-DNN_ENABLE_DOC=$(usex doc ON OFF)
		)
	else
		mycmakeargs+=(
			-DNN_ENABLE_DOC=OFF
			-DNN_ENABLE_TOOLS=OFF
			-DNN_ENABLE-NANOCAT=OFF
		)
	fi
	cmake_src_configure
}
