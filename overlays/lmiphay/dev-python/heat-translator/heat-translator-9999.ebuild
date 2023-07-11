# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_11)

inherit eutils distutils-r1 git-r3

DESCRIPTION="Translate non-heat templates to Heat Orchestration Template"
HOMEPAGE="https://github.com/openstack/heat-translator"
EGIT_REPO_URI="https://github.com/openstack/heat-translator.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
	dev-python/Babel
	dev-python/cliff
	dev-python/pbr
	dev-python/python-dateutil
	dev-python/pyyaml
	dev-python/six
	dev-python/tosca-parser
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"
