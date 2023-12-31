# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# File was automatically generated by automatic-ebuild-maker
# https://github.com/BlueManCZ/automatic-ebuild-maker

EAPI=7
inherit unpacker

DESCRIPTION="A p2p video streaming client"
HOMEPAGE="https://launchpad.net/~linuxthebest.net/+archive/ubuntu/sopcast"
SRC_URI="${HOMEPAGE}/+files/sp-auth_${PV}-1ubuntu3_amd64.deb -> ${P}.deb"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="-* ~amd64"
RESTRICT="bindist mirror"
IUSE="doc"

RDEPEND=""

QA_PREBUILT="*"

S=${WORKDIR}

src_prepare() {
	default

	if use doc ; then
		unpack "usr/share/doc/sp-auth/changelog.Debian.gz" || die "unpack failed"
		rm -f "usr/share/doc/sp-auth/changelog.Debian.gz" || die "rm failed"
		mv "changelog.Debian" "usr/share/doc/sp-auth" || die "mv failed"
	fi
}

src_install() {
	cp -a . "${ED}" || die "cp failed"

	rm -r "${ED}/usr/share/doc/sp-auth" || die "rm failed"

	if use doc ; then
		dodoc -r "usr/share/doc/sp-auth/"* || die "dodoc failed"
	fi
}
