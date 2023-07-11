# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit udev systemd

AR_DATE="2022-08"
AR_NAME="DisplayLink%20USB%20Graphics%20Software%20for%20Ubuntu5.6.1-EXE.zip"
UBUNTU_VER="1604"

MY_PV=$(ver_rs 3 '-')
MY_P="${PN}-${MY_PV}"
S="${WORKDIR}/${MY_P}"

SRC_URI="https://www.synaptics.com/sites/default/files/exe_files/${AR_DATE}/${AR_NAME} -> ${P}.zip"
KEYWORDS="~amd64"

DESCRIPTION="Driver for modern DisplayLink devices"
HOMEPAGE="http://www.displaylink.com/downloads/ubuntu"
LICENSE="DisplayLink-EULA"
SLOT="0"
IUSE="systemd"

DEPEND="app-arch/unzip"
RDEPEND="
	virtual/libusb
	virtual/udev
	x11-libs/libevdi
"

QA_PREBUILT="opt/displaylink/DisplayLinkManager"

src_unpack() {
	default
	sh "${WORKDIR}/${MY_P}.run" --noexec --keep
}

src_prepare() {
	default
	source "${S}/udev-installer.sh" && create_udev_rules_file "${S}/99-dlm.rules"
	source "${S}/udev-installer.sh" && displaylink_bootstrapper_code > "${S}/udev.sh"
	if use systemd; then
		sed -i '/^  chmod.*displaylink-driver.service/d' "${S}/displaylink-installer.sh"
		sed -i 's;^  cat > /.*/displaylink-driver.service <<EOF;  cat <<EOF;' "${S}/displaylink-installer.sh"
		sed -i '/^if.*$(id -u).*then/i return' "${S}/displaylink-installer.sh"
		source "${S}/udev-installer.sh" && systemd_start_stop_functions >> "${S}/udev.sh"
		source "${S}/displaylink-installer.sh" && add_systemd_service > "${S}/displaylink-driver.service"
	else
		cat "${FILESDIR}/openrc_start_stop_functions" >> "${S}/udev.sh"
	fi
	source "${S}/udev-installer.sh" && create_main_function >> "${S}/udev.sh"
}

src_install() {
	exeinto "/opt/displaylink"
	insinto "/opt/displaylink"
	case "${ARCH}" in
		amd64)	MY_ARCH="x64" ;;
		*)		MY_ARCH="${ARCH}" ;;
	esac
	ARCH_DIR="${S}/${MY_ARCH}-ubuntu-${UBUNTU_VER}"
	doexe "${ARCH_DIR}/DisplayLinkManager"
	doins "${S}/ella-dock-release.spkg"
	doins "${S}/firefly-monitor-release.spkg"
	doins "${S}/ridge-dock-release.spkg"
	if use systemd; then
		systemd_dounit "${S}/displaylink-driver.service"
	else
		newinitd "${FILESDIR}/dlm.init.d" "dlm"
	fi
	udev_dorules "${S}/99-dlm.rules"
	insopts -m744
	doins "${S}/udev.sh"
}

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
