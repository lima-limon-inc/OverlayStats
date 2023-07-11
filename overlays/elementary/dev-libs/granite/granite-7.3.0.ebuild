# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VALA_MIN_API_VERSION=0.48

inherit meson vala xdg

DESCRIPTION="Elementary OS library that extends GTK+"
HOMEPAGE="https://github.com/elementary/granite"
SRC_URI="https://github.com/elementary/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3+"
SLOT="7"
KEYWORDS="amd64 ~arm ~x86"
IUSE="demo doc"

RDEPEND="
	>=dev-libs/glib-2.50:2
	dev-libs/libgee:0.8[introspection]
	gui-libs/gtk:4[introspection]
"

DEPEND="${RDEPEND}
	$(vala_depend)
	virtual/pkgconfig
"

src_prepare() {
	eapply_user
	use demo || sed -i -e '/demo/d' meson.build
	vala_setup
}

src_configure() {
	local emesonargs=(
		-Ddocumentation=$(usex doc true false)
	)
	meson_src_configure
}
