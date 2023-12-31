# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_COMMIT="a16d67e5807f57fc4e550299cf20226194497dc2"
README_GENTOO_SUFFIX="-r1"

inherit readme.gentoo-r1 java-pkg-2 systemd

DESCRIPTION="The official server for the sandbox video game"
HOMEPAGE="https://www.minecraft.net/"
SRC_URI="https://launcher.mojang.com/v1/objects/${EGIT_COMMIT}/server.jar -> ${P}.jar"

LICENSE="Mojang"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
	acct-group/minecraft
	acct-user/minecraft
	app-misc/dtach
	dev-java/openjdk-bin:16[gentoo-vm]
"

RESTRICT="bindist mirror"

S="${WORKDIR}"

src_unpack() {
	cp "${DISTDIR}/${A}" "${WORKDIR}" || die
}

src_compile() {
	:;
}

src_install() {
	java-pkg_newjar minecraft-server-${PV}.jar minecraft-server.jar
	java-pkg_dolauncher minecraft-server --jar minecraft-server.jar --java_args "\${JAVA_OPTS}"

	newinitd "${FILESDIR}"/minecraft-server.initd-r4 minecraft-server
	newconfd "${FILESDIR}"/minecraft-server.confd-r1 minecraft-server
	systemd_newunit "${FILESDIR}"/minecraft-server.service minecraft-server@.service

	readme.gentoo_create_doc
}

pkg_postinst() {
	sed -i '$i gjl_vm="openjdk-bin-16"' "${EROOT}/usr/bin/minecraft-server"
	sed -i '$i GENTOO_VM="${gjl_vm}"' "${EROOT}/usr/bin/minecraft-server"
	readme.gentoo_print_elog
}
