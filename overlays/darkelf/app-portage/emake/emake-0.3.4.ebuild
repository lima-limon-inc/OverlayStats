# taken from gentoo portage tree
# updated manually by Simon the Sorcerer

EAPI=7

DESCRIPTION="A Shellscript for generating generic .ebuilds."
HOMEPAGE="http://homepages.uni-paderborn.de/neuron/gentoo/emake/"
SRC_URI="http://homepages.uni-paderborn.de/neuron/gentoo/emake/${P}.txz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="amd64 ~ppc ~ppc64 ~x86"

RDEPEND="
"

DEPEND="
	${RDEPEND}
"

S=${WORKDIR}

src_install() {
	dosbin emake
	insinto /etc/portage/repos.conf/
	doins emake.conf
	insinto /var/db/repos/
	doins -r repos/emake
}

pkg_postinst() {
	elog "This ebuild installed a local empty portage tree in /var/db/repos/emake/ where ebuilds created by emake will reside to be modified by root."
}
