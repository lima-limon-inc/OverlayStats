# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1 readme.gentoo-r1

DESCRIPTION="Access your Google contacts from the command line"
HOMEPAGE="https://gitlab.com/goobook/goobook"
SRC_URI="mirror://pypi/g/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	>=dev-python/google-api-python-client-2.68.0[${PYTHON_USEDEP}]
	>=dev-python/simplejson-3.18.0[${PYTHON_USEDEP}]
	>=dev-python/oauth2client-4.1.3[${PYTHON_USEDEP}]
	>=dev-python/pyxdg-0.28[${PYTHON_USEDEP}]
	>=dev-python/setuptools-65.6.3[${PYTHON_USEDEP}]"

PATCHES=(
	"${FILESDIR}"/${P}-setup.patch
)

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
To setup initial authentication, execute:

~ $ goobook authenticate

If you want to use goobook from mutt, add this in your .muttrc file:
	set query_command=\"goobook query '%s'\"
to query address book.

You may find more information and advanced configuration tips at
https://pypi.org/project/${PN}/${PV} in \"Configure/Mutt\" section"

src_install() {
	distutils-r1_src_install
	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}
