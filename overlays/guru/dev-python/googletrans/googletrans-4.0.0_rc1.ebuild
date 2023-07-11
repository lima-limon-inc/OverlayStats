# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_10 pypy3 )
inherit distutils-r1 pypi

MY_PV=${PV/_/}
DESCRIPTION="Free Google Translate API for Python. Translates totally free of charge."
HOMEPAGE="https://pypi.org/project/googletrans/ https://github.com/ssut/py-googletrans"
SRC_URI="$(pypi_sdist_url --no-normalize ${PN} ${MY_PV}) -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${MY_PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
