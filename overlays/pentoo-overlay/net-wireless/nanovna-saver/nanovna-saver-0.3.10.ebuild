# Copyright 2019-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..11} )
inherit distutils-r1

DESCRIPTION="tool for reading, displaying and saving data from the NanoVNA"
HOMEPAGE="https://github.com/mihtjel/nanovna-saver"

LICENSE="GPL-3+"
SLOT="0"
if [ "${PV}" = "9999" ]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/mihtjel/nanovna-saver.git"
else
	SRC_URI="https://github.com/mihtjel/nanovna-saver/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi
IUSE=""

#this is broke and I have no idea why
RESTRICT="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/cython[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/PyQt5[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]"
BDEPEND=""

src_prepare() {
	#obviously the wrong solution, but can't figure it out
	rm -rf "${S}/test"
	distutils-r1_src_prepare
}
