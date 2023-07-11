# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

URELEASE="jammy"
inherit autotools eutils pam readme.gentoo-r1 systemd ubuntu-versionator vala

DESCRIPTION="A lightweight display manager"
HOMEPAGE="https://launchpad.net/lightdm"
SRC_URI="${UURL}/${MY_P}.orig.tar.xz
	${UURL}/${MY_P}-${UVER}.debian.tar.xz"

LICENSE="GPL-3 LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE_LIGHTDM_GREETERS="gtk"
for greeters in ${IUSE_LIGHTDM_GREETERS}; do
	IUSE+=" lightdm_greeters_${greeters}"
done

# add and enable 'unity' greeter by default
IUSE+=" +lightdm_greeters_unity audit +introspection non-root qt5 test"
RESTRICT="mirror"

COMMON_DEPEND="dev-libs/glib:2
	dev-libs/libxml2
	sys-apps/accountsservice
	sys-libs/pam
	x11-apps/xhost
	x11-libs/libX11
	>=x11-libs/libxklavier-5
	audit? ( sys-process/audit )
	introspection? ( >=dev-libs/gobject-introspection-1 )
	qt5? (
		dev-qt/qtchooser
		dev-qt/qtcore:5
		dev-qt/qtdbus:5
		dev-qt/qtgui:5
		)"
RDEPEND="${COMMON_DEPEND}
	acct-group/lightdm
	acct-group/video
	acct-user/lightdm
	sys-auth/pambase
	x11-apps/xrandr
	>=app-eselect/eselect-lightdm-0.2"
DEPEND="${COMMON_DEPEND}
	dev-util/gtk-doc-am
	dev-util/intltool
	gnome-base/gnome-common
	sys-devel/gettext
	virtual/pkgconfig
	$(vala_depend)"
PDEPEND="lightdm_greeters_gtk? ( x11-misc/lightdm-gtk-greeter )
	lightdm_greeters_unity? ( unity-extra/unity-greeter )"
DOCS=( NEWS )

pkg_setup() {
	ubuntu-versionator_pkg_setup
	if [ -z "${LIGHTDM_GREETERS}" ]; then
		ewarn "At least one GREETER should be set in /etc/make.conf"
	fi
}

src_prepare() {
	ubuntu-versionator_src_prepare

	sed -i -e 's:getgroups:lightdm_&:' tests/src/libsystem.c || die #412369
	sed -i -e '/minimum-uid/s:500:1000:' data/users.conf || die

	# Add support for settings GSettings/dconf defaults in the guest session. Just
	# put the files in /etc/guest-session/gsettings/. The file format is the same
	# as the regular GSettings override files.
	pushd "${WORKDIR}"
		eapply "${FILESDIR}"/guest-session-add-default-gsettings-support_1.22.0.patch
	popd

	vala_src_prepare
	export VALA_API_GEN="$VAPIGEN"

	# Remove bogus Makefile statement. This needs to go upstream
	sed -i /"@YELP_HELP_RULES@"/d help/Makefile.am || die

	if has_version dev-libs/gobject-introspection; then
		eautoreconf
	else
		AT_M4DIR=${WORKDIR} eautoreconf
	fi
}

src_configure() {
	# Set default values if global vars unset
	local _greeter _session _user
	_greeter=${LIGHTDM_GREETER:=unity-greeter}
	_session=${LIGHTDM_SESSION:=unity}
	_user="$(usex non-root "${LIGHTDM_USER}" root)"
	# Let user know how lightdm is configured
	einfo "Gentoo configuration"
	einfo "Default greeter: ${_greeter}"
	einfo "Default session: ${_session}"
	einfo "Greeter user: ${_user}"

	econf \
		--localstatedir=/var \
		--disable-static \
		--enable-vala \
		$(use_enable audit libaudit) \
		$(use_enable introspection) \
		$(use_enable qt5 liblightdm-qt5) \
		$(use_enable test tests) \
		--with-user-session=${_session} \
		--with-greeter-session=${_greeter} \
		--with-greeter-user=${_user} \
		--with-html-dir="${EPREFIX}"/usr/share/gtk-doc/html/${PF}
}

src_install() {
	default

	# Delete apparmor profiles because they only work with Ubuntu's
	# apparmor package. Bug #494426
	if [[ -d ${D}/etc/apparmor.d ]]; then
		rm -r "${D}/etc/apparmor.d" || die \
			"Failed to remove apparmor profiles"
	fi

	insinto /etc/${PN}
	doins data/keys.conf
	newins data/${PN}.conf ${PN}.conf_example
	doins "${FILESDIR}"/${PN}.conf

	insinto /etc/${PN}/${PN}.conf.d
	doins "${FILESDIR}"/50-display-setup.conf		# Executes lightdm-greeter-display-setup
	doins "${WORKDIR}"/debian/50-greeter-wrapper.conf	# Executes lightdm-greeter-session

	exeinto /usr/lib/${PN}
	doexe "${WORKDIR}"/debian/lightdm-greeter-session	# Handle extraneous dbus processes (eliminates 2nd nm-applet icon)
	# script makes lightdm multi monitor sessions aware
	# and enable first display as primary output
	# all other monitors are aranged right of it in a row
	#
	# on 'unity-greeter' the login prompt will follow the mouse cursor
	#
	doexe "${FILESDIR}"/lightdm-greeter-display-setup       # Handle multi-monitor setups

	exeinto /usr/sbin
	newexe "${FILESDIR}"/Xsession lightdm-session		# Install our custom Xsession as /usr/sbin/lightdm-session

	# install guest-account script
	exeinto /usr/bin
	newexe "${WORKDIR}"/debian/guest-account.sh guest-account || die
	# to work the script properly
	exeinto /usr/share/lightdm/guest-session
	doexe "${FILESDIR}"/setup.sh
	dodir /usr/share/lightdm/guest-session/skel

	# Add guest session GSettings defaults
	gsettings_path="/etc/guest-session/gsettings/"
	local gschema="99_default"
	insinto ${gsettings_path}
	newins "${FILESDIR}/${gschema}".gsettings-override \
		"${gschema}".gschema.override

	# Install systemd tmpfiles.d file
	insinto /usr/lib/tmpfiles.d
	newins "${FILESDIR}"/${PN}.tmpfiles.d ${PN}.conf || die

	# Install PolicyKit rules from Fedora which allow the lightdm user to access
	# the systemd-logind, consolekit, and upower DBus interfaces
	insinto /usr/share/polkit-1/rules.d
	newins "${FILESDIR}"/${PN}.rules ${PN}.rules || die

	# Remove unused libtool libarchive files #
	find "${ED}" -name '*.la' -delete || die

	rm -rf "${ED}"/etc/init

        # Remove existing pam file. We will build a new one. Bug #524792
        rm -rf "${ED}"/etc/pam.d/${PN}{,-greeter}
        pamd_mimic system-local-login ${PN} auth account password session #372229
        pamd_mimic system-local-login ${PN}-greeter auth account password session #372229
        dopamd "${FILESDIR}"/${PN}-autologin #390863, #423163

	# Add gnome-keyring support to automatically
	# unlock the keyring once you log in. Issue #203
	sed -i \
		-e "/^auth/ a -auth\toptional\tpam_gnome_keyring.so" \
		-e "/^session/ a -session\toptional\tpam_gnome_keyring.so auto_start" \
		"${ED}/etc/pam.d/${PN}" || die

	readme.gentoo_create_doc
	systemd_dounit "${FILESDIR}/${PN}.service"

	# Create data directory
	keepdir /var/lib/${PN}-data
}

pkg_postinst() {
	elog
	elog "Guest session is disabled by default."
	elog "To enable it edit '/etc/${PN}/${PN}.conf'"
	elog "and set 'allow-guest=true'."
	elog
	elog "Guest session GSettings defaults can be"
	elog "found in '${gsettings_path}'."
	elog "You can place your settings over here."
	elog "Higher numbered files have higher priority."
	elog
}
