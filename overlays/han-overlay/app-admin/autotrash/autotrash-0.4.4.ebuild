# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
DISTUTILS_USE_SETUPTOOLS="rdepend"

inherit distutils-r1 pypi

DESCRIPTION="Script to automatically purge old trash"
HOMEPAGE="https://bneijt.nl/pr/autotrash"

KEYWORDS="~amd64"

LICENSE="GPL-3+"
SLOT="0"
IUSE=""
