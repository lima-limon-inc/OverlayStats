# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A modern and asynchronous C++ logging library"
HOMEPAGE="https://github.com/KjellKod/g3log"
EGIT_REPO_URI="https://github.com/KjellKod/g3log.git"
SRC_URI="https://github.com/KjellKod/g3log/archive/refs/tags/2.3.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="amd64"
IUSE="debug"

DEPEND=""
RDEPEND="${DEPEND}"

CMAKE_BUILD_TYPE="Release"

DOCS=( docs )
