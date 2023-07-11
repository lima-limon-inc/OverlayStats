# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1 git-r3

DESCRIPTION="Native Python cross-version decompiler and fragment decompiler."
HOMEPAGE="https://github.com/rocky/python-decompile3"
EGIT_REPO_URI="https://github.com/rocky/python-decompile3.git"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	dev-python/hypothesis[${PYTHON_USEDEP}]
	dev-python/spark[${PYTHON_USEDEP}]
	dev-python/xdis[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
