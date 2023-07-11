# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KEYWORDS="~arm ~arm64"

DESCRIPTION="Firmware files for the integrated WiFi and Bluetooth on the Rpi400"
HOMEPAGE="https://github.com/RPi-Distro/firmware-nonfree"
SRC_URI=""
LICENSE="Broadcom"
SLOT="0"
IUSE=""
RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"

# Required so Portage has a source directory to work with
S="${WORKDIR}"

# Bundling files to avoid having to download the entire firmware git
src_install() {
	insinto "/lib/firmware/brcm"
	newins "${FILESDIR}/brcmfmac43456-sdio.txt-20201225" brcmfmac43456-sdio.txt
	newins "${FILESDIR}/brcmfmac43456-sdio.bin-20201225" brcmfmac43456-sdio.bin
	newins "${FILESDIR}/brcmfmac43456-sdio.clm_blob-20201225" brcmfmac43456-sdio.clm_blob
}
