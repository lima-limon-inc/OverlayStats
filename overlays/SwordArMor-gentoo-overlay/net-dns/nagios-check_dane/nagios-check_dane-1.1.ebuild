# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit python-r1

MY_PN=${PN/nagios-/}

DESCRIPTION="Nagios/Icinga plugin for checking DANE/TLSA records"
HOMEPAGE="https://github.com/debfx/check_dane"
MY_GITHUB_AUTHOR="debfx"
SRC_URI="https://github.com/${MY_GITHUB_AUTHOR}/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-lang/python-3.4
	dev-libs/openssl
	dev-python/dnspython
"
BDEPEND=""

S="${WORKDIR}/${MY_PN}-${PV}"

src_install() {
	python_scriptinto /usr/lib64/nagios/plugins/
	python_foreach_impl python_doscript check_dane

	dodoc README.md
}
