# Copyright 2019-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop udev

MY_PN=OpenTabletDriver

DESCRIPTION="Cross platform tablet driver (binary package)"
HOMEPAGE="https://github.com/OpenTabletDriver"
SRC_URI="https://github.com/OpenTabletDriver/OpenTabletDriver/archive/refs/tags/v${PV}.tar.gz -> OpenTabletDriver-source-${PV}.tar.gz https://github.com/OpenTabletDriver/OpenTabletDriver/releases/download/v${PV}/OpenTabletDriver.linux-x64.tar.gz -> OpenTabletDriver-v${PV}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	x11-libs/libX11
	x11-libs/libXrandr
	dev-libs/libevdev
	x11-libs/gtk+:3
	virtual/udev
	virtual/libudev
	dev-dotnet/dotnet-sdk-bin:6.0
"

QA_PREBUILT="*"

S="${WORKDIR}/${MY_PN}"
src_install() {
	local LP=opentabletdriver
	local SP="otd"

	cd "${S}" || die

	exeinto "/usr/share/${MY_PN}"
	exeopts -o root -Dm755

	for binary in *.dll *.json; do
		doexe "$binary"
	done

	for bin in *.Daemon *.UX.Gtk *.Console; do
		doexe "$bin"
	done

	insinto "/lib/udev/rules.d"
	doins -r "${S}/99-${LP}.rules"

	cd "${FILESDIR}" || die
	dobin "${SP}"
	dobin "${SP}-gui"

	cd "${WORKDIR}/${MY_PN}-${PV}/${MY_PN}.UX/Assets" || die
	doicon "otd.png"
	make_desktop_entry /usr/bin/otd-gui OpenTabletDriver otd Settings
}

pkg_postrm() {
	udev_reload
}

pkg_postinst() {
	udev_reload
	udevadm control --reload || die
	if [[ -z ${REPLACING_VERSIONS} ]]; then
		elog "Please replug your tablet before attempting to use the driver"
	fi
}
