# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.freedesktop.org/libdecor/libdecor.git"
else
	SRC_URI="https://gitlab.freedesktop.org/libdecor/libdecor/-/archive/${PV}/${P}.tar.bz2"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A client-side decorations library for Wayland clients"
HOMEPAGE="https://gitlab.freedesktop.org/libdecor/libdecor"
LICENSE="MIT"
SLOT="0"
IUSE="+dbus"

DEPEND="
	>=dev-libs/wayland-1.18
	>=dev-libs/wayland-protocols-1.15
	dbus? ( sys-apps/dbus )
	x11-libs/pango
"
RDEPEND="${DEPEND}"
BDEPEND=">=dev-util/meson-0.47"
