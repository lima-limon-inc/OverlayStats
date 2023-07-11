# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools desktop flag-o-matic toolchain-funcs

#CANON_REL="08"
CANON_REL="18"
#DL_ID="8/0100007658/25"
DL_ID="1/0100005951/10"
MY_PV="${PV//\./}"

DESCRIPTION="Canon UFR II / LIPSLX Printer Driver for Linux (USA)"
HOMEPAGE="https://www.usa.canon.com/support/p/imageclass-lbp6030w"
SRC_URI="http://gdlp01.c-wss.com/gds/${DL_ID}/linux-UFRIILT-drv-v${MY_PV}-usen-${CANON_REL}.tar.gz"

LICENSE="Canon-UFR-II GPL-2 MIT"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""

DEPEND="dev-libs/atk
	dev-libs/glib:2
	dev-libs/libxml2:2
	gnome-base/libglade:2.0
	media-libs/jbigkit
	media-libs/libjpeg-turbo
	net-print/cups
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:2
	x11-libs/gtk+:3
	x11-libs/pango
	media-libs/jbigkit"
RDEPEND="${DEPEND}
	!net-print/cndrvcups-common-lb
	!net-print/cndrvcups-lb"

HTML_DOCS=(
	"${WORKDIR}"/linux-UFRIILT-drv-v${MY_PV}-usen/Documents/README-ufr2lt-${PV::-1}xUS.html
	"${WORKDIR}"/linux-UFRIILT-drv-v${MY_PV}-usen/Documents/UsersGuide-ufr2lt-US.html
)

S="${WORKDIR}/linux-UFRIILT-drv-v${MY_PV}-usen/Sources"

common_op() {
	local i
	for i in backend buftool cngplp cnjbig rasterfilter; do
		cd "${S}/cnrdrvcups-common-${PV}/${i}" ||
			die "failed to switch dir to ${i}"
		"${@}"
		cd "${S}" || die "failed to switch dir back from ${i} to ${S}"
	done
}

driver_op() {
	local i
	for i in cngplp cngplp/files cpca; do
		cd "${S}/cnrdrvcups-sfp-${PV}/${i}" ||
			die "failed to switch dir to ${i}"
		"${@}"
		cd "${S}" || die "failed to switch dir back from ${i} to ${S}"
	done
}

pkg_setup() {
	QA_PREBUILT="/usr/bin/cnpkmodulencapr
		/usr/bin/cnrsdrvsfp
		/usr/bin/cnsetuputil2l
		/usr/bin/commandfilefilterr
		/usr/bin/pnksmncapr
		/usr/$(get_libdir)/libcaepcmsfp.so.1.0
		/usr/$(get_libdir)/libcaio_usb_cdcr.so.1.0.0
		/usr/$(get_libdir)/libcaiousb.so.1.0.0
		/usr/$(get_libdir)/libcaiowrapsfp.so.1.0.0
		/usr/$(get_libdir)/libcanon_commonr.so.1.0.0
		/usr/$(get_libdir)/libcanon_slimsfp.so.1.0.0
		/usr/$(get_libdir)/libcanoncapr.so.1.0.0
		/usr/$(get_libdir)/libccpd_utilr.so.1.0.0
		/usr/$(get_libdir)/libcnaccm.so.1.0
		/usr/$(get_libdir)/libcnlbcmr.so.1.0
		/usr/$(get_libdir)/libcnncapcmr.so.1.0
		/usr/$(get_libdir)/libColorGearCsfp.so.2.0.0
		/usr/$(get_libdir)/libcomm_ncapcaior.so.1.0.0
		/usr/$(get_libdir)/libcomm_usbmlportr.so.1.0.0
		/usr/$(get_libdir)/libcomm_usbsockr.so.1.0.0
		/usr/$(get_libdir)/libcomm_websrvr.so.1.0.0
		/usr/$(get_libdir)/libCommIsolationr.so.1.0.0
		/usr/$(get_libdir)/libCUPS_Communicatorr.so.1.0.0
		/usr/$(get_libdir)/libinfo_analyzer.so.1.0.0
		/usr/$(get_libdir)/libinfor.so.1.0.0
		/usr/$(get_libdir)/liblibncapfilterr.so.1.0.0"

	#QA_SONAME="/usr/$(get_libdir)/libcaiocnpkbidir.so.1.0.0"
}

src_unpack() {
	unpack ${A}
	cd "${WORKDIR}/linux-UFRIILT-drv-v${MY_PV}-usen/Sources/" || die
	unpack ./${P}-1.tar.gz
}

src_prepare() {
	default

	common_op mv configure.in configure.ac || die "failed to move configure.in"
	driver_op mv configure.in configure.ac || die "failed to move configure.in"

	common_op sed -i -e 's/configure.in/configure.ac/' configure.ac || die
	driver_op sed -i -e 's/configure.in/configure.ac/' configure.ac || die

	# This should work with autoreconf
	export "LIBS=-lgtk-x11-2.0 -lgobject-2.0 -lglib-2.0 -lgmodule-2.0"

	# Other components already depend on compiled product
	append-ldflags -L"${S}/cnrdrvcups-common-${PV}/buftool"

	common_op eautoreconf
	driver_op eautoreconf

	# Fix a QA issue with .desktop file,
	sed -i 's/Application;Utility/Utility/g' "${S}"/cnrdrvcups-utility-${PV}/data/cnsetuputil2l.desktop ||
		die "Failed to modify cnsetuputil2l.desktop file."

	append-cflags -fcommon

	# For some reason, @AR@ is defined everywhere else correctly, but not here.
	sed -i -e "s/AR = ar/AR = $(tc-getAR)/g" ./cnrdrvcups-common-${PV}/buftool/Makefile.in || die
}

src_configure() {
	common_op econf
	driver_op econf
}

src_compile() {
	common_op emake
	driver_op emake
}

src_install() {
	common_op emake DESTDIR="${D}" install COMMON_SUFFIX=2
	driver_op emake DESTDIR="${D}" install COMMON_SUFFIX=2

	insinto /usr/share/cups
	# no longer exists
	#doins "${S}"/cnrdrvcups-common-${PV}/Rule/canon-laser-printer_ufr2.usb-quirks
	doins "${S}"/cnrdrvcups-sfp-${PV}/rules/canon-sfp-printerr.usb-quirks
	doins "${S}"/cnrdrvcups-sfp-${PV}/rules/80-usb-ncapstatusui2l.rules

	if use amd64; then
		cd "${S}"/lib/libs64/ || die "failed to switch into libs64"
	elif use x86; then
		cd "${S}"/lib/libs32/ || die "failed to switch into libs32"
	else
		die "I don't know what directory to switch into!"
	fi

	#dolib.so libcaepcmufr2.so.1.0 libcaiocnpkbidir.so.1.0.0 \
	#	libcaiowrapufr2.so.1.0.0 libcanonufr2r.so.1.0.0 \
	#	libcanon_slimufr2.so.1.0.0 libcnlbcmr.so.1.0 \
	#	libColorGearCufr2.so.2.0.0 libufr2filterr.so.1.0.0

	dolib.so libcaepcmsfp.so.1.0 libcaio_usb_cdcr.so.1.0.0 \
		libcaiousb.so.1.0.0 libcaiowrapsfp.so.1.0.0 \
		libcanon_commonr.so.1.0.0 libcanon_slimsfp.so.1.0.0 \
		libcanonncapr.so.1.0.0 libccpd_utilr.so.1.0.0 \
		libcnaccm.so.1.0 libcnlbcmr.so.1.0 \
		libcnncapcmr.so.1.0 libColorGearCsfp.so.2.0.0 \
		libcomm_ncapcaior.so.1.0.0 libcomm_stdoutr.so.1.0.0 \
		libcomm_usbmlportr.so.1.0.0 libcomm_usbsockr.so.1.0.0 \
		libcomm_websrvr.so.1.0.0 libCommIsolationr.so.1.0.0 \
		libCUPS_Communicatorr.so.1.0.0 libinfo_analyzer.so.1.0.0 \
		libinfor.so.1.0.0 libncapfilterr.so.1.0.0

	dosym libcaepcmsfp.so.1.0 /usr/$(get_libdir)/libcaepcmsfp.so
	dosym libcaepcmsfp.so.1.0 /usr/$(get_libdir)/libcaepcmsfp.so.1

	dosym libcanon_slimsfp.so.1.0.0 /usr/$(get_libdir)/libcanon_slimsfp.so
	dosym libcanon_slimsfp.so.1.0.0 /usr/$(get_libdir)/libcanon_slimsfp.so.1

	dosym libinfor.so.1.0.0 /usr/$(get_libdir)/libinfor.so
	dosym libinfor.so.1.0.0 /usr/$(get_libdir)/libinfor.so.1

	#dosym libcaepcmufr2.so.1.0 /usr/$(get_libdir)/libcaepcmufr2.so
	#dosym libcaepcmufr2.so.1.0 /usr/$(get_libdir)/libcaepcmufr2.so.1

	#dosym libcaiocnpkbidir.so.1.0.0 /usr/$(get_libdir)/libcaiocnpkbidir.so
	#dosym libcaiocnpkbidir.so.1.0.0 /usr/$(get_libdir)/libcaiocnpkbidir.so.1

	#dosym libcaiowrapufr2.so.1.0.0 /usr/$(get_libdir)/libcaiowrapufr2.so
	#dosym libcaiowrapufr2.so.1.0.0 /usr/$(get_libdir)/libcaiowrapufr2.so.1

	#dosym libcanonufr2r.so.1.0.0 /usr/$(get_libdir)/libcanonufr2r.so
	#dosym libcanonufr2r.so.1.0.0 /usr/$(get_libdir)/libcanonufr2r.so.1

	#dosym libcanon_slimufr2.so.1.0.0 /usr/$(get_libdir)/libcanon_slimufr2.so
	#dosym libcanon_slimufr2.so.1.0.0 /usr/$(get_libdir)/libcanon_slimufr2.so.1

	#dosym libcnlbcmr.so.1.0 /usr/$(get_libdir)/libcnlbcmr.so
	#dosym libcnlbcmr.so.1.0 /usr/$(get_libdir)/libcnlbcmr.so.1

	#dosym libColorGearCufr2.so.2.0.0 /usr/$(get_libdir)/libColorGearCufr2.so
	#dosym libColorGearCufr2.so.2.0.0 /usr/$(get_libdir)/libColorGearCufr2.so.2

	#dosym libufr2filterr.so.1.0.0 /usr/$(get_libdir)/libufr2filterr.so
	#dosym libufr2filterr.so.1.0.0 /usr/$(get_libdir)/libufr2filterr.so.1

	#dobin cnpdfdrv cnpkbidir cnpkmoduleufr2r cnrsdrvufr2 cnsetuputil2
	dobin cnpkmodulencapr cnrsdrvsfp cnsetuputil2l commandfilefilterr pksmncapr

	#insinto /usr/share/cnpkbidir
	#doins ./cnpkbidir_info*

	#insinto /usr/share/ufr2filterr
	insinto /usr/share/libncapfilterr
	doins ./ThLB*

	cd "${S}" || die "Failed to switch back into ${S} during installation."

	dosym ../../../$(get_libdir)/cups/backend/cnusb /usr/libexec/cups/backend/cnusb
	#dosym ../../../$(get_libdir)/cups/filter/pdftocpca /usr/libexec/cups/filter/pdftocpca
	#dosym ../../../$(get_libdir)/cups/filter/rastertoufr2 /usr/libexec/cups/filter/rastertoufr2
	dosym ../../../$(get_libdir)/cups/filter/rastertosfp /usr/libexec/cups/filter/rastertosfp

	#insinto /usr/share/caepcm/ufr2
	#doins -r "${S}"/lib/data/ufr2/

	insinto /usr/share/caepcm/sfp
	doins -r "${S}"/lib/data/sfp/

	insinto /usr/share/cups/model
	doins ${P}/ppd/*.ppd

	domenu ./cnrdrvcups-utility-${PV}/data/cnsetuputil2l.desktop
	doicon ./cnrdrvcups-utility-${PV}/data/cnsetuputil.png

	einstalldocs
	newdoc "${S}"/cnrdrvcups-common-${PV}/README README.common
	newdoc "${S}"/cnrdrvcups-common-${PV}/cngplp/README README.cngplp.common
	newdoc "${S}"/cnrdrvcups-sfp-${PV}/README README.lb
	newdoc "${S}"/cnrdrvcups-sfp-${PV}/cngplp/README README.cngplp.driver

	find "${D}" -name '*.la' -type f -delete || die
}
