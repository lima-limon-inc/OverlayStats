# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ "${PV}" == *9999 ]]; then
	MATE_THEMES_V=".9999"
else
	MATE_THEMES_V="*"
	KEYWORDS="~amd64 ~arm ~arm64 ~loong ~riscv ~x86"
fi

DESCRIPTION="Meta package to facilitate easy use of x11-themes/mate-themes"
HOMEPAGE="https://wiki.gentoo.org/wiki/Project:MATE"
SRC_URI=""

LICENSE="metapackage"
SLOT="0"
IUSE="gtk2-only"

DEPEND=""
RDEPEND="|| (
		gtk2-only? (
			!!x11-libs/gtk+:3
			x11-themes/mate-themes:0
		)
		(
			>=x11-libs/gtk+-3.22:3
			=x11-themes/mate-themes-3.22${MATE_THEMES_V}:0/3.22
		)
	)"
