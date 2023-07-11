# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Multiplatform C++ network packet sniffing and crafting library"
HOMEPAGE="https://libtins.github.io/"
MY_GITHUB_AUTHOR="mfontanini"
SRC_URI="https://github.com/${MY_GITHUB_AUTHOR}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	${DEPEND}
	net-libs/libpcap
	dev-libs/openssl
"
BDEPEND="dev-util/cmake"
