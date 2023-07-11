# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit savedconfig webapp

MY_PN="${PN/-/.}"
MY_P="${MY_PN}-${PV}"
DESCRIPTION="Free and open-source browser XMPP chat client"
HOMEPAGE="https://conversejs.org/"
MY_GITHUB_AUTHOR="conversejs"
SRC_URI="https://github.com/${MY_GITHUB_AUTHOR}/${MY_PN}/releases/download/v${PV}/${MY_P}.tgz"

LICENSE="MPL-2.0"
KEYWORDS="~amd64 ~x86"
IUSE="+omemo"
REQUIRED_USE="omemo? ( savedconfig )"

DEPEND="omemo? ( www-apps/libsignal-protocol-javascript )"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/package"

src_prepare() {
	default

	restore_config index.html
}

src_install() {
	webapp_src_preinst

	dodoc README.md
	rm -f README.md

	use savedconfig && save_config index.html || doins "${FILESDIR}/index.html"

	insinto "${MY_HTDOCSDIR}/"
	doins -r .

	webapp_src_install
}

pkg_postinst() {
	use omemo &&
		einfo "To enable OMEMO encryption, you have to edit index.html to add"
		einfo "	omemo_default: 'true'"
		einfo "in converse.initialize and"
		einfo "	<script type=\"text/javascript\" src=\"libsignal-protocol-javascript/dist/libsignal-protocol.js\">"
		einfo "in <head>."
}
