# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
PYTHON_REQ_USE="threads(+)"

inherit git-r3 python-single-r1 waf-utils

EGIT_REPO_URI="https://github.com/grejppi/bitrot.git"

DESCRIPTION="Audio effect plugins (LV2, VST2, LADSPA) for glitch effects"
HOMEPAGE="https://github.com/grejppi/bitrot"
LICENSE="Apache-2.0"
SLOT="0"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND=""
RDEPEND="${PYTHON_DEPS}"
BDEPEND=""

src_prepare() {
	default
	sed -i -e "s|\${{PREFIX}}/lib/|\${{PREFIX}}/$(get_libdir)/|" plugins/wscript || die
}
