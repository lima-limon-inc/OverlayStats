# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

URELEASE="jammy"
inherit gnome2 meson systemd ubuntu-versionator

MY_P="${PN}_${PV}"
S="${WORKDIR}/${PN}-${PV}"

DESCRIPTION="Gnome session manager patched for the Unity desktop"
HOMEPAGE="https://git.gnome.org/browse/gnome-session"
SRC_URI="http://ftp.gnome.org/pub/gnome/sources/${PN}/42/${PN}-${PV}.tar.xz
	${UURL}/${MY_P}-${UVER}${UVER_PREFIX}.debian.tar.xz"

LICENSE="GPL-2 LGPL-2 FDL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc elibc_FreeBSD ipv6 systemd wayland +xdg-dirs"
RESTRICT="mirror"

# x11-misc/xdg-user-dirs{,-gtk} are needed to create the various XDG_*_DIRs, and
# create .config/user-dirs.dirs which is read by glib to get G_USER_DIRECTORY_*
# xdg-user-dirs-update is run during login (see 10-user-dirs-update-gnome below).
# gdk-pixbuf used in the inhibit dialog
COMMON_DEPEND="
	>=dev-libs/glib-2.58.0:2[dbus]
	x11-libs/gdk-pixbuf:2
	>=x11-libs/gtk+-3.18.0:3
	>=dev-libs/json-glib-0.10
	>=gnome-base/gnome-desktop-3.27.90:3
	elibc_FreeBSD? ( dev-libs/libexecinfo )

	media-libs/mesa[gles2]

	media-libs/libepoxy
	x11-libs/libSM
	x11-libs/libICE
	x11-libs/libXau
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXext
	x11-libs/libXrender
	x11-libs/libXtst
	x11-apps/xdpyinfo

	systemd? ( >=sys-apps/systemd-183:0= )
	xdg-dirs? (
		x11-misc/xdg-user-dirs
		x11-misc/xdg-user-dirs-gtk )
"
# Pure-runtime deps from the session files should *NOT* be added here
# Otherwise, things like gdm pull in gnome-shell
# gnome-themes-standard is needed for the failwhale dialog themeing
# sys-apps/dbus[X] is needed for session management
RDEPEND="${COMMON_DEPEND}
	>=gnome-base/gnome-settings-daemon-3.30.1
	>=gnome-base/gsettings-desktop-schemas-3.28.1
	x11-themes/adwaita-icon-theme
	sys-apps/dbus[X]
	!systemd? (
		sys-auth/consolekit
		>=dev-libs/dbus-glib-0.76
	)
"
DEPEND="${COMMON_DEPEND}
	dev-libs/libxslt
	>=dev-util/intltool-0.40.6
	>=sys-devel/gettext-0.10.40
	virtual/pkgconfig
	!<gnome-base/gdm-2.20.4
	doc? (
		app-text/xmlto
		dev-libs/libxslt )
"

src_prepare() {
	ubuntu-versionator_src_prepare

	# Desktop Session is named 'unity' #
	sed -e 's/:ubuntu//' \
		-i data/unity.session.desktop.in.in \
		-i data/unity.desktop.in.in || die
	sed -e 's:buntu:nity:g' \
		-i "${WORKDIR}/debian/data/unity-session.target" || die
	sed -e 's:/usr/lib/gnome-session:/usr/libexec:g' \
		-i gnome-session/gnome-session.in \
		-i data/unity.desktop.in.in || die

	# Disable all language files as they can be incomplete #
	#  due to being provided by Ubuntu's language-pack packages #
	> po/LINGUAS

	# If a .desktop file does not have inline
	# translations, fall back to calling gettext
	echo "X-GNOME-Gettext-Domain=${PN}-3.0" >> "data/${PN}-properties.desktop.in"

	gnome2_src_prepare
}

src_install() {
	meson_src_install

	dodir /etc/X11/Sessions
	exeinto /etc/X11/Sessions
	newexe "${FILESDIR}/Gnome-3.28" Gnome

	insinto /usr/share/applications
	newins "${FILESDIR}/defaults.list-r3" gnome-mimeapps.list

	dodir /etc/X11/xinit/xinitrc.d/
	exeinto /etc/X11/xinit/xinitrc.d/
	newexe "${FILESDIR}/15-xdg-data-gnome-r1" 15-xdg-data-gnome

	# This should be done here as discussed in bug #270852
	newexe "${FILESDIR}/10-user-dirs-update-gnome-r1" 10-user-dirs-update-gnome

	# Set XCURSOR_THEME from current dconf setting instead of installing
	# default cursor symlink globally and affecting other DEs (bug #543488)
	# https://bugzilla.gnome.org/show_bug.cgi?id=711703
	newexe "${FILESDIR}/90-xcursor-theme-gnome" 90-xcursor-theme-gnome

#-----------------------------------------------------------------------------------#

	# 'startx' visible via the XSESSION variable #
	exeinto /etc/X11/Sessions
	newexe "${FILESDIR}/unity.xsession" unity

	# Set Unity XDG desktop session variables #
	exeinto /etc/X11/xinit/xinitrc.d
	newexe "${FILESDIR}/15-xdg-data-unity" 15-xdg-data-unity

	# Enables and fills $DESKTOP_SESSION variable for sessions started using 'startx'
	exeinto /etc/X11/xinit/xinitrc.d/
	newexe "${FILESDIR}/05-unity-desktop-session" 05-unity-desktop-session

	# Start gnome-session using systemd #
	exeinto /usr/libexec
	doexe "${WORKDIR}/debian/data/run-systemd-session"

	# Install systemd unit files to enable starting desktop sessions via systemd #
	systemd_douserunit "${WORKDIR}/debian/data/gnome-session.service"
	systemd_douserunit "${WORKDIR}/debian/data/unity-session.target"

	insinto /etc/lightdm/lightdm.conf.d
	doins "${WORKDIR}/debian/data/50-unity.conf"

	if use wayland; then
		sed -e 's:^Exec=gnome-session:Exec=gnome-session --session=gnome:g' \
			-e 's:TryExec=gnome-session:TryExec=gnome-shell:g' \
				-i "${ED}usr/share/xsessions/gnome-xorg.desktop"
		rm "${ED}"/usr/share/xsessions/gnome.desktop
	else
		rm "${ED}"/usr/share/xsessions/gnome-xorg.desktop
		rm "${ED}"/usr/share/wayland-sessions/gnome.desktop
	fi

	# Remove Ubuntu only session files #
	rm "${ED}"/usr/share/wayland-sessions/ubuntu*.desktop
	rm "${ED}"/usr/share/xsessions/ubuntu*.desktop
	rm "${ED}"/usr/share/gnome-session/sessions/ubuntu.session

	mv "${ED%/}/usr/share/doc/${PN}" "${ED%/}/usr/share/doc/${PF}"
	einstalldocs
}

pkg_postinst() {
	gnome2_pkg_postinst

	if ! has_version gnome-base/gdm && ! has_version kde-plasma/kdm; then
		ewarn "If you use a custom .xinitrc for your X session,"
		ewarn "make sure that the commands in the xinitrc.d scripts are run."
	fi

	ubuntu-versionator_pkg_postinst
}
