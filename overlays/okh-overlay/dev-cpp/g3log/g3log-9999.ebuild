# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="A modern and asynchronous C++ logging library"
HOMEPAGE="https://github.com/KjellKod/g3log"
EGIT_REPO_URI="https://github.com/KjellKod/g3log.git"
SRC_URI=""

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug"

DEPEND=""
RDEPEND="${DEPEND}"

CMAKE_BUILD_TYPE="Release"

DOCS=( README.markdown API.markdown )
