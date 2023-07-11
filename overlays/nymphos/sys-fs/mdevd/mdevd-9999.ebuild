# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A mdev-compatible Linux hotplug manager daemon"
HOMEPAGE="https://skarnet.org/software/${PN}/"
if [[ "${PV}" = 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://git.skarnet.org/${PN}"
else
	SRC_URI="${HOMEPAGE}${P}.tar.gz"
	KEYWORDS="amd64"
fi

LICENSE="ISC"
SLOT="0"

RDEPEND=">=dev-libs/skalibs-2.13.1.0"
DEPEND="${RDEPEND}
	sys-kernel/linux-headers"

src_configure() {
	econf \
		--dynlibdir="/usr/$(get_libdir)" \
		--libdir="/usr/$(get_libdir)/${PN}" \
		--with-sysdeps="/usr/$(get_libdir)/skalibs"
}
