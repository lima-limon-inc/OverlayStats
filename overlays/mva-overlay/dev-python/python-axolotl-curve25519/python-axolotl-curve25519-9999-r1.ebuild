# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{8..11} )

DISTUTILS_USE_PEP517="setuptools"

inherit distutils-r1 git-r3

DESCRIPTION="Python wrapper for the curve25519 library"
HOMEPAGE="https://github.com/tgalal/python-axolotl-curve25519"
EGIT_REPO_URI="https://github.com/tgalal/python-axolotl-curve25519.git"

LICENSE="GPL-3"
SLOT="0"

DOCS=( README.md )
