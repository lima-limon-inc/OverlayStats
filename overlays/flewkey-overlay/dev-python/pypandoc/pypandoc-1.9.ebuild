# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/NicklasTegner/pypandoc.git"
else
	SRC_URI="https://github.com/NicklasTegner/pypandoc/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Thin wrapper for pandoc"
HOMEPAGE="https://github.com/NicklasTegner/pypandoc"
LICENSE="MIT"
SLOT="0"

DEPEND=""
RDEPEND="app-text/pandoc"
BDEPEND=">=dev-python/pip-8.1.10"
