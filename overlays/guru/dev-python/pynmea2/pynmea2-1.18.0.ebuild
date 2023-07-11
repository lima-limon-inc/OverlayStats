# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_10 pypy3 )

inherit distutils-r1

DESCRIPTION="Python library for the NMEA 0183 protcol"
HOMEPAGE="
	https://github.com/Knio/pynmea2
	https://pypi.org/project/pynmea2/
"
SRC_URI="https://github.com/Knio/pynmea2/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

KEYWORDS="~amd64"
LICENSE="MIT"
SLOT="0"

distutils_enable_tests pytest
