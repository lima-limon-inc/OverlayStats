# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit optfeature readme.gentoo-r1

DESCRIPTION="A tool to probe for hardware, check it's operability and find drivers"
HOMEPAGE="https://github.com/linuxhw/hw-probe/"

MY_PV="$(ver_rs 2 -)"
MY_P="${PN}-${MY_PV}"

if [[ "${PV}" == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/linuxhw/${PN}.git"
	inherit git-r3
else
	SRC_URI="https://github.com/linuxhw/hw-probe/archive/ref/tags/${MY_PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="-* ~amd64 ~arm64 ~x86"
fi

LICENSE="LGPL-2.1+"
SLOT="0"

RDEPEND="
	dev-lang/perl
	dev-perl/Digest-SHA1
	net-misc/curl
	sys-apps/dmidecode
	sys-apps/edid-decode
	sys-apps/hwinfo
	sys-apps/pciutils
	sys-apps/smartmontools
	sys-apps/usbutils
	virtual/perl-Data-Dumper
"

src_compile() {
	:;
}

src_install() {
	default

	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog

	optfeature "showing Machine Check Exceptions." app-admin/mcelog
	optfeature "showing additional I/O statistics." app-admin/sysstat
	optfeature "showing display data channel (ddc) information." app-misc/ddcutil
	optfeature "showing smart card (reader) information." dev-libs/opensc
	optfeature "showing Vulkan GPU hardware information." dev-util/vulkan-tools
	optfeature "showing information of attached scanners." media-gfx/sane-backends
	optfeature "showing GPU information provided by MESA." media-libs/mesa
	optfeature "showing zeroconf statistics." net-dns/avahi
	optfeature "showing HP printer statistics." net-print/hplip
	optfeature "showing status about rfkill switches on communication devices." net-wireless/rfkill
	optfeature "showing additional CPU capabilities." sys-apps/cpuid
	optfeature "showing hard disk (HDD, SSD, ..) capabilities." sys-apps/hdparm
	optfeature "showing available I2C sensors." sys-apps/i2c-tools
	optfeature "showing additional hardware and system information detected by inxi." sys-apps/inxi
	optfeature "showing information about tested memory for faults." sys-apps/memtester
	optfeature "showing 'Plug & Play' devices." sys-apps/pnputils
	optfeature "showing systemd boot process information." sys-apps/systemd
	optfeature "showing ACPI statistics and tables." sys-power/iasl
	optfeature "showing information about NUMA." sys-process/numactl
	optfeature "showing additional GPU information provided by MESA progs." x11-apps/mesa-progs
	optfeature "showing available Xinput devices." x11-apps/xinput
}
