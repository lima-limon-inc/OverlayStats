# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1 gnome2-utils ubuntu-versionator xdg-utils

URELEASE="jammy"
UVER="+-${PVR_PL_MAJOR}ubuntu${PVR_PL_MINOR}"

DESCRIPTION="Configuration manager for the Unity desktop environment"
HOMEPAGE="https://launchpad.net/unity-tweak-tool"
SRC_URI="${UURL}/${MY_P}+.orig.tar.gz
	${UURL}/${MY_P}${UVER}.debian.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+bluetooth +files nls"
RESTRICT="mirror"

RDEPEND="dev-libs/glib:2
	dev-python/pycairo[${PYTHON_USEDEP}]
	dev-python/pyxdg[${PYTHON_USEDEP}]
	dev-python/pygobject:3[${PYTHON_USEDEP}]
	dev-python/python-distutils-extra[${PYTHON_USEDEP}]
	x11-libs/gtk+:3"
DEPEND="${RDEPEND}
	dev-util/intltool
	gnome-base/gsettings-desktop-schemas
	gnome-extra/nemo
	sys-devel/gettext
	unity-base/compiz
	unity-base/hud
	unity-base/overlay-scrollbar
	unity-base/unity
	unity-base/unity-settings-daemon
	unity-indicators/indicator-datetime
	unity-indicators/indicator-power
	unity-indicators/indicator-session
	unity-indicators/indicator-sound
	unity-lenses/unity-lens-applications
	virtual/pkgconfig
	x11-misc/notify-osd

	bluetooth? ( unity-indicators/unity-indicators-meta[bluetooth] )
	files? ( unity-lenses/unity-lens-meta[files] )

	${PYTHON_DEPS}"

S="${WORKDIR}/${PN}-${PV}"

pkg_setup() {
	ubuntu-versionator_pkg_setup

	## Cherry picked from gnome2_environment_reset() in xdg-utils.eclass ##
	#  Sandbox violations occur when building outside of an Xsession and XDG_RUNTIME_DIR is not defined to be in the sandbox
	#    but build will fail with the following if XDG_CACHE_HOME is defined (see issue #125): 'ImportError: No module named 'values'
	export XDG_RUNTIME_DIR="${T}/run"
	mkdir -p "${XDG_RUNTIME_DIR}" || die
	# This directory needs to be owned by the user, and chmod 0700
	# http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
	chmod 0700 "${XDG_RUNTIME_DIR}" || die
	unset DBUS_SESSION_BUS_ADDRESS
}

src_prepare() {
	ubuntu-versionator_src_prepare
	# Make Unity Tweak Tool appear in unity-control-center #
	sed -e 's:Categories=.*:Categories=Settings;X-GNOME-Settings-Panel;X-GNOME-PersonalSettings;X-Unity-Settings-Panel;:' \
		-e 's: %f::' \
		-e '/Actions=/{:a;n;/^$/!ba;i\X-Unity-Settings-Panel=unitytweak' -e '}' \
			-i unity-tweak-tool.desktop.in || die

	# Include /usr/share/cursors/xorg-x11/ in the paths to check for cursor themes as Gentoo #
	#  installs cursor themes in both /usr/share/cursors/xorg-x11/ and /usr/share/icons/ #
	eapply -p1 "${FILESDIR}/xorg-cursor-themes-path.diff"

	! use bluetooth && sed -i \
		-e "/indicator.bluetooth/d" \
		UnityTweakTool/section/spaghetti/gsettings.py

	! use files && sed -i \
		-e "/FilesLens/d" \
		UnityTweakTool/section/spaghetti/gsettings.py

	distutils-r1_src_prepare
}

src_install() {
	distutils-r1_src_install

	exeinto /etc/X11/xinit/xinitrc.d
	doexe "${FILESDIR}/95-xcursor-theme"

	python_foreach_impl python_optimize

	mv "${ED%/}/usr/share/doc/${PN}" "${ED%/}/usr/share/doc/${PF}"
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	ubuntu-versionator_pkg_postinst
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
