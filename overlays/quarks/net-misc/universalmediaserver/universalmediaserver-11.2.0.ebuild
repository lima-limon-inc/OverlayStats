# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

# Todo:
# - Add support for none x86_64

EAPI="6"

inherit eutils

DESCRIPTION="Universal Media Server is a DLNA-compliant UPnP Media Server."
HOMEPAGE="http://www.universalmediaserver.com/"
SRC_URI="https://github.com/UniversalMediaServer/UniversalMediaServer/releases/download/${PV}/UMS-${PV}-x86_64.tgz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+dcraw +ffmpeg +libmediainfo +libzen +mplayer multiuser +vlc"

DEPEND="app-arch/unzip"
RDEPEND=">=virtual/jre-17
	dcraw? ( media-gfx/dcraw )
	ffmpeg? ( media-video/ffmpeg[encode] )
	libmediainfo? ( media-libs/libmediainfo )
	libzen? ( media-libs/libzen )
	mplayer? ( media-video/mplayer[encode] )
	vlc? ( media-video/vlc[encode] ) "

S=${WORKDIR}/ums-${PV}
UMS_HOME=/opt/${PN}

src_prepare() {
	default

	if use multiuser; then
		cat > ${PN} <<-EOF
		#!/bin/sh
		if [ ! -e ~/.${PN} ]; then
			echo "Copying ${UMS_HOME} to ~/.${PN}"
			cp -pPR "${UMS_HOME}" ~/.${PN}
		fi
		export UMS_HOME=\${HOME}/.${PN}
		exec "\${UMS_HOME}/UMS.sh" "\$@"
		EOF
	else
		cat > ${PN} <<-EOF
		#!/bin/sh
		export UMS_HOME=${UMS_HOME}
		exec "\${UMS_HOME}/UMS.sh" "\$@"
		EOF
	fi

	cat > ${PN}.desktop <<-EOF
	[Desktop Entry]
	Name=Universal Media Server
	GenericName=Media Server
	Exec=${PN}
	Icon=${PN}
	Type=Application
	Categories=Network;
	EOF

	unzip -j ums.jar resources/images/icon-{32,256}.png || die -n "failed to extract icons" || return ${?}
}

src_install() {
	dobin ${PN}

	exeinto ${UMS_HOME}
	doexe UMS.sh

	insinto ${UMS_HOME}
	doins -r ums.jar *.conf documentation renderers web *.xml
	dodoc CHANGELOG.md README.md

	newicon -s 32 icon-32.png ${PN}.png
	newicon -s 256 icon-256.png ${PN}.png

	domenu ${PN}.desktop

	newconfd "${FILESDIR}/${PN}.confd" ${PN}
	newinitd "${FILESDIR}/${PN}.initd" ${PN}
}

pkg_postinst() {
	if [[ -z ${REPLACING_VERSIONS} ]]; then
		ewarn "Don't forget to disable transcoding engines for software"
		ewarn "that you don't have installed (such as having the ffmpeg"
		ewarn "transcoding engine enabled when you only have mencoder)."
	elif use multiuser; then
		ewarn "Remember to refresh the files in ~/.config/UMS/"
	fi
}
