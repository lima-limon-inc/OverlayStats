# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="科学操长城软件"
HOMEPAGE="https://github.com/avplayer/avsocks"
SRC_URI=""

inherit cmake git-r3

EGIT_REPO_URI="https://github.com/avplayer/avsocks.git"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-libs/boost
	dev-libs/openssl
	"
RDEPEND="${DEPEND}"
