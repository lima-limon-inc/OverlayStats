# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 meson
EGIT_REPO_URI="https://gitlab.com/drobilla/zix.git"

DESCRIPTION="A C data structures library"
HOMEPAGE="https://gitlab.com/drobilla/zix"
LICENSE="ISC"
SLOT="0"
IUSE="doc"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="doc? ( dev-python/sphinx )"

src_configure() {
	local emesonargs=(
		$(meson_feature doc docs)
	)
	meson_src_configure
}
