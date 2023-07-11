# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8,9,10} )

inherit git-r3 python-r1

DESCRIPTION="Tool for partial deblobbing of Intel ME/TXE firmware images"
HOMEPAGE="https://github.com/corna/me_cleaner"
EGIT_REPO_URI="https://github.com/corna/me_cleaner.git"

LICENSE="GPL-3+"
SLOT="0"
IUSE=""
RESTRICT="mirror"
KEYWORDS="~amd64 ~arm ~arm64"

RDEPEND=${PYTHON_DEPS}
REQUIRED_USE=${PYTHON_REQUIRED_USE}

src_install() {
	python_foreach_impl python_newscript "${PN}"{.py,}
	dodoc "README.md"
	doman "man/${PN}.1"
}

