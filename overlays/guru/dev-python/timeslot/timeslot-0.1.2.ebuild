# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{10..11} pypy3 )

inherit distutils-r1 pypi

DESCRIPTION="Time slots/intervals with an arbitrary start and stop"
HOMEPAGE="https://github.com/ErikBjare/timeslot"
LICENSE="MIT"


KEYWORDS="~amd64"
SLOT="0"

# Not available for now
RESTRICT="test"
