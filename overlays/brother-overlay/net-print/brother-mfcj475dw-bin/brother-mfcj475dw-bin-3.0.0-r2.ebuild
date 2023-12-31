# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Original made for Brother MFC-J880DW printer by Chris Morgenstern[machredsch]

EAPI=8

inherit rpm multilib

MODEL="mfcj475dw"
LPR_DLF=006846
CW_SRC_DLF=006867
CW_DLF=006848
BR_PR=${PR/r/}
let BR_PR=( ${BR_PR}-1 )

DESCRIPTION="Brother MFC-J475DW lpr+cupswrapper (printer) drivers"
HOMEPAGE="http://support.brother.com/g/b/downloadtop.aspx?c=us&lang=en&prod=${MODEL}_us_as"
SRC_URI="http://download.brother.com/welcome/dlf${LPR_DLF}/${MODEL}lpr-${PV}-${BR_PR}.i386.rpm
		http://download.brother.com/welcome/dlf${CW_SRC_DLF}/${MODEL}_cupswrapper_GPL_source_${PV}-${BR_PR}.tar.gz"
		# for no source only use:
		# http://download.brother.com/welcome/dlf${CW_DLF}/${MODEL}cupswrapper-${PV}-${BR_PR}.i386.rpm
LICENSE="GPL-2+ brother-eula no-source-code"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="-metric -debug"
RESTRICT="strip mirror"

DEPEND="net-print/cups"
RDEPEND="${DEPEND}"

DEST="/opt/brother/Printers/${MODEL}"
S="${WORKDIR}${DEST}"

src_prepare() {
	eapply_user

	if use metric; then
		sed -i '/^PaperType/s/Letter/A4/' inf/br${MODEL}rc || die
	fi

	mv "${WORKDIR}/${MODEL}_cupswrapper_GPL_source_${PV}-${BR_PR}/" "${S}/cupswrapper-src/" || die

	# Extract the needed bundled lpdwrapper script from within brothers generate script.
	# Our needed script is located between tags.
	cd "cupswrapper-src" || die
	local TAG="\!ENDOFWFILTER\!"
	sed -ne "/${TAG}/,/${TAG}/!d" -e "/${TAG}/d; p" < cupswrapper/cupswrapper${MODEL} > brother_lpdwrapper_${MODEL} || die

	# exchange the vars in the script with the values of our ones and
	# remove masking backslashes and some other stuff
	local PRINTER_NAME="${MODEL^^}"
	sed -i -e "s|\${printer_model}|${MODEL}|g;s|\${device_model}|Printers|g;s|\${printer_name}|${PRINTER_NAME}|g;s|exit \$errorcode|exit|" \
		-e 's|\\\([\$\`]\)|\1|g' brother_lpdwrapper_${MODEL} || die

	if use debug; then
		sed -i '/^DEBUG=/s/.$/1/' brother_lpdwrapper_${MODEL} || die
	fi
}

src_compile() {
	cd cupswrapper-src/brcupsconfpt1 || die
	emake brcupsconfpt1
}

src_install() {
	has_multilib_profile && ABI=x86

	cd cupswrapper-src || die
	exeinto /usr/libexec/cups/filter
	doexe brother_lpdwrapper_${MODEL}

	cd brcupsconfpt1 || die
	exeinto ${DEST}/cupswrapper
	doexe brcupsconfpt1

	cd ../PPD || die
	insinto ${DEST}/cupswrapper
	doins brother_${MODEL}_printer_en.ppd
	insinto /usr/share/cups/model/Brother
	doins brother_${MODEL}_printer_en.ppd
	insinto /usr/share/ppd/Brother
	doins brother_${MODEL}_printer_en.ppd

	# proprietary binary included, no source available
	cd ../../lpd || die
	exeinto ${DEST}/lpd
	doexe br${MODEL}filter filter${MODEL} psconvertij2

	cd ../inf || die
	insinto ${DEST}/inf
	doins br${MODEL}rc br${MODEL}func ImagingArea PaperDimension paperinfij2
	doins -r lut

	# proprietary binary, no source available
	cd "${WORKDIR}/usr/bin" || die
	into /usr
	dobin brprintconf_${MODEL}
}

pkg_postinst () {
	ewarn "Because /usr/bin/brprintconf_${MODEL} uses /var/tmp to create a simple temp file on printing, make sure the directory has enough rights (eg. 1777)"
	ewarn "or you won't be able to change print options on printing and therefore you always have to edit /opt/brother/Printers/inf/br${MODEL}rc, manually!"
}
