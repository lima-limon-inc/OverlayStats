# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..11} )

inherit python-single-r1

DESCRIPTION="Python 3 script to draw a heatmap of a btrfs filesystem"
HOMEPAGE="https://github.com/knorrie/btrfs-heatmap"
SRC_URI="https://github.com/knorrie/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	dev-python/python-btrfs"
DEPEND="${RDEPEND}"

src_install()
{
	dobin btrfs-heatmap
	python_fix_shebang "${ED}"/usr/bin/btrfs-heatmap
	default
}
