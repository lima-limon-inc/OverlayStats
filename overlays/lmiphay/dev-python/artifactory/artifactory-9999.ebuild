# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_{10,11})

inherit eutils distutils-r1 git-r3

DESCRIPTION="A Python client for Artifactory"
HOMEPAGE="https://github.com/Parallels/artifactory"
EGIT_REPO_URI="https://github.com/Parallels/artifactory.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS="README.md"

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/python-dateutil
	dev-python/pathlib
	dev-python/requests
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"
