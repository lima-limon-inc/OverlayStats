# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A libpurple protocol plugin that adds support for the Telegram messenger"
HOMEPAGE="https://github.com/majn/telegram-purple"
EGIT_REPO_URI="https://github.com/majn/telegram-purple.git"

LICENSE="GPL-2+"
KEYWORDS=""
SLOT="0"
IUSE="gcrypt +nls +png +webp"

RDEPEND="
	net-im/pidgin
	sys-libs/zlib:=
	gcrypt? ( dev-libs/libgcrypt:0= )
	!gcrypt? ( dev-libs/openssl:0= )
	png? ( media-libs/libpng:0= )
	webp? ( media-libs/libwebp:= )
"

DEPEND="${RDEPEND}"

BDEPEND="
	nls? ( sys-devel/gettext )
	virtual/pkgconfig
"

DOCS=( "AUTHORS" "CHANGELOG.md" "HACKING.md" "HACKING.BUILD.md" "README.md" )

src_prepare() {
	default

	# Remove '-Werror' to make it compile
	find -name 'Makefile*' -exec sed -i -e 's/-Werror //' {} + || die
}

src_configure() {
	local myeconfargs=(
		$(use_enable gcrypt)
		$(use_enable nls translation)
		$(use_enable png libpng)
		$(use_enable webp libwebp)
	)

	econf "${myeconfargs[@]}"
}
