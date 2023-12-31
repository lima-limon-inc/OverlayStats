# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Audio metadata tag reader and writer implemented in pure Python"
HOMEPAGE="https://github.com/quodlibet/mutagen https://pypi.org/project/mutagen/"
SRC_URI="https://github.com/quodlibet/mutagen/releases/download/release-${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

BDEPEND="
	test? (
		dev-python/eyeD3[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/pyflakes[${PYTHON_USEDEP}]
		media-libs/flac[ogg]
	)
"

DOCS=( NEWS README.rst )

distutils_enable_tests pytest
distutils_enable_sphinx docs \
	dev-python/sphinx_rtd_theme

python_test() {
	local deselect=(
		tests/quality/test_flake8.py
	)
	epytest "${deselect[@]/#/--deselect }"
}
