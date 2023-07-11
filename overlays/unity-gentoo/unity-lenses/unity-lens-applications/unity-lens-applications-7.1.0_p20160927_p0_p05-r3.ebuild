# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

URELEASE="jammy"
inherit autotools eutils gnome2-utils ubuntu-versionator

UVER_PREFIX="+16.10.${PVR_MICRO}"

DESCRIPTION="Application lens for the Unity desktop"
HOMEPAGE="https://launchpad.net/unity-lens-applications"
SRC_URI="${UURL}/${MY_P}${UVER_PREFIX}.orig.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

DEPEND="dev-lang/vala:0.44
	dev-libs/dee:=
	dev-libs/libcolumbus:=
	dev-libs/libunity:=
	dev-libs/libzeitgeist
	dev-libs/xapian:=
	gnome-base/gnome-menus:3
	gnome-extra/zeitgeist[datahub,fts]
	sys-libs/db:5.3
	unity-base/unity"

S="${WORKDIR}"
export VALAC=$(type -P valac-0.44)

src_prepare() {
	ubuntu-versionator_src_prepare

	# Disable all language files as they can be incomplete #
	#  due to being provided by Ubuntu's language-pack packages #
	> po/LINGUAS

	eautoreconf
	# Alter source to work with Gentoo's sys-libs/db slots #
	sed -e 's:"db.h":"db5.3/db.h":g' \
		-i configure || die
	sed -e 's:-ldb$:-ldb-5.3:g' \
		-i src/* || die
	sed -e 's:<db.h>:<db5.3/db.h>:g' \
		-i src/* || die
}

src_install() {
	default
	prune_libtool_files --modules
}

pkg_preinst() {
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_schemas_update
	ubuntu-versionator_pkg_postinst
}

pkg_postrm() {
	gnome2_schemas_update
}
