# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1 gnome2-utils meson xdg

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.gnome.org/World/apostrophe.git"
else
	MY_P="${PN}-v${PV}"
	S="${WORKDIR}/${MY_P}"
	SRC_URI="https://gitlab.gnome.org/World/apostrophe/-/archive/v${PV}/${MY_P}.tar.bz2 -> ${P}.tar.bz2"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A distraction free Markdown editor"
HOMEPAGE="https://apps.gnome.org/app/org.gnome.gitlab.somas.Apostrophe/"
LICENSE="GPL-3"
SLOT="0"

DEPEND="
	app-text/gspell
	app-text/pandoc
	dev-libs/glib
	dev-libs/gobject-introspection
	>=gui-libs/libhandy-1.6.0
	net-libs/webkit-gtk:4[introspection]
	sys-devel/gettext
	x11-libs/gtk+:3[introspection]
"
RDEPEND="
	${DEPEND}
	dev-python/pycairo[${PYTHON_USEDEP}]
	dev-python/pyenchant[${PYTHON_USEDEP}]
	dev-python/pygobject[${PYTHON_USEDEP}]
	dev-python/pypandoc[${PYTHON_USEDEP}]
	dev-python/Levenshtein[${PYTHON_USEDEP}]
	dev-python/regex[${PYTHON_USEDEP}]
"
BDEPEND="dev-lang/sassc"

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

distutils_enable_tests pytest
