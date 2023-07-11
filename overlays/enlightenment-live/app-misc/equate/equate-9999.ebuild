# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools git-r3 xdg

DESCRIPTION="Enlightenment calculator"
HOMEPAGE="https://www.enlightenment.org/"
EGIT_REPO_URI="https://git.enlightenment.org/enlightenment/${PN}.git"

LICENSE="BSD-2"
[ "${PV}" = 9999 ] || KEYWORDS="~amd64 ~x86"
SLOT="0"

IUSE=""

RDEPEND="
	>=dev-libs/efl-1.18.0
	"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${P/_/-}"

src_prepare() {
	# Rerun autotools
	einfo "Regenerating autotools files..."
	eautoreconf
	eapply_user
}

src_configure() {
	econf
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install
}
