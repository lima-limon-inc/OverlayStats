# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
inherit eutils
DESCRIPTION="UniFi controller"
HOMEPAGE="https://www.ubnt.com/download/unifi"
case "$PVR" in
5.8.25_rc1)v1=-34502471b9;;
5.10.20)v1=-b06c46ec1d;;
*)v1='';;
esac
#SRC_URI="http://dl.ubnt.com/unifi/"${PV%_*}"/unifi_sysvinit_all.deb -> ${PN}-${PV}.deb"
SRC_URI="https://dl.ubnt.com/unifi/"${PV%_*}"$v1/UniFi.unix.zip -> ${PN}-${PV}.zip
	https://dl.ubnt.com/unifi/"${PV%_*}"$v1/unifi_sh_api -> unifi_sh_api-${PV}"
SLOT="opt"
KEYWORDS="~amd64 ~arm"
#RDEPEND="dev-db/mongodb virtual/jdk:1.8"
#=dev-db/mongodb-3.4* but 3.6+WiredTiger working
RDEPEND="dev-db/mongodb
	|| (
		>=dev-java/icedtea-3.11.0:8
		dev-java/icedtea:8[sunec]
		dev-java/icedtea-bin:8
	)"

src_unpack() {
	default_src_unpack
	cd "${WORKDIR}" || die
	local f
	for f in $A; do
		case "$f" in
		*.deb)unpack ./data.tar.gz && mv usr/lib/unifi "${S}" || die;;
		unifi_sh_api-*)cp "$DISTDIR/$f" "${S}/unifi_sh_api";;
		*.zip)mv UniFi "${S}" || die;;
		esac
	done
}

src_prepare(){
	default
	local n="$S/lib/native"
	if use amd64; then
		rm "$n/Linux/armhf" -Rf
	else
		rm "$n/Linux/x86_64" -Rf
	fi
	rm "$n/"{Mac,Windows} -Rf
}

src_install(){
	dodir /opt
	mv "${S}" "${D}"/opt/UniFi || die
	rm "${D}"/opt/UniFi/bin/mongod
	exeinto /etc/unifi/bin
	doexe "${FILESDIR}"/mongod.sh
	dosym /etc/unifi/bin/mongod.sh /opt/UniFi/bin/mongod
	newinitd "${FILESDIR}/${PN}".init "${PN}"
}

pkg_postinst(){
	einfo 'Remember to use NSS-enabled java VM (dev-java/icedtea:8[sunec] is good),'
	einfo 'then uncomment NSS security provider in ${java.home}/jre/lib/security/java.security:'
	einfo 'security.provider.10=sun.security.pkcs11.SunPKCS11 ${java.home}/lib/security/nss.cfg'
}
