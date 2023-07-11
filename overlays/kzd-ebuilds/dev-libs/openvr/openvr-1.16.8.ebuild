# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3 multilib-minimal

DESCRIPTION="OpenVR is an API and runtime that allows access to VR hardware from multiple vendors without requiring that applications have specific knowledge of the hardware they are targeting."
HOMEPAGE="https://github.com/ValveSoftware/openvr"
SRC_URI=""

LICENSE="OpenVR"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND=""
RDEPEND="sys-libs/glibc
	sys-devel/gcc"

EGIT_REPO_URI=https://github.com/ValveSoftware/${PN}.git
EGIT_COMMIT=v${PV}

src_prepare() {
	eapply_user
	multilib_copy_sources
}

multilib_src_install() {
	local ld
	[[ $(get_libdir) =~ ^lib(32|64)$ ]] && ld=${BASH_REMATCH[1]}
	dolib.so lib/linux${ld}/lib${PN}_api.so
	dosym /usr/lib${ld}/lib${PN}_api.so /usr/lib${ld}/lib${PN}_api.so.${PV}
	insinto ${EPREFIX}/usr/include/${PN}
	for file in headers/* ; do
		doins ${file}
	done
	dodoc LICENSE README.md
}
