# Copyright 2018-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-info git-r3

FORK="ntop" #use thinrope for more stable :-D
EGIT_REPO_URI="https://github.com/${FORK}/PF_RING.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"

DESCRIPTION="PF_RING: High-speed packet processing framework (libpfring)"
HOMEPAGE="https://www.ntop.org/products/packet-capture/pf_ring/"

LICENSE="LGPL-2.1"
SLOT="0"
if [[ ${PV} != *9999 ]] ; then
	KEYWORDS="~amd64"
	EGIT_BRANCH="${PV}-stable"
else
	EGIT_BRANCH="master"
fi
IUSE=""

S="${WORKDIR}/${PN}/userland/lib"

DEPEND="sys-kernel/linux-headers
	sys-process/numactl"
RDEPEND="${DEPEND}
	~sys-kernel/pf_ring-kmod-${PV}"

src_configure() {
	set -- "${S}/configure" \
		--prefix="${EPREFIX}/usr" \
		--libdir="${EPREFIX}/usr/$(get_libdir)" \
		--mandir="${EPREFIX}/usr/share/man" \
	echo "${@}"
	"${@}" || die
}

src_install() {
	emake DESTDIR="${D}" install-includes
	default
	# FIXME: Do we need to install nbpftest
}
