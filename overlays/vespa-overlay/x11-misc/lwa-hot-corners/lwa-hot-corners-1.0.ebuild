# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Pretty simple hot corners implementation for X server"
HOMEPAGE="https://github.com/thiagovespa/lwa-hot-corners"
SRC_URI="https://github.com/thiagovespa/lwa-hot-corners/archive/refs/tags/v1.0.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	x11-libs/libX11
"
RDEPEND="${DEPEND}"
BDEPEND=""
