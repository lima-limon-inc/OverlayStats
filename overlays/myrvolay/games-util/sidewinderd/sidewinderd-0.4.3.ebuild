# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Linux support for Microsoft SideWinder X4 / X6 and Logitech G103 / G105 / G710+"
HOMEPAGE="https://github.com/tolga9009/sidewinderd"
SRC_URI="https://github.com/tolga9009/sidewinderd/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/libconfig
	dev-libs/tinyxml2
	virtual/libudev
"
RDEPEND="${DEPEND}"
