# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3

DESCRIPTION="SkypeWeb Plugin for Pidgin"
HOMEPAGE="https://github.com/EionRobb/skype4pidgin"
EGIT_REPO_URI="https://github.com/EionRobb/skype4pidgin.git"
LICENSE="GPL-3+"
SLOT="0"

BDEPEND="virtual/pkgconfig"
RDEPEND="dev-libs/json-glib
	net-im/pidgin"
DEPEND="${RDEPEND}"

pkg_postinst() {
	elog "If you get error message like 'Failed getting Magic T value':"
	elog "Go to https://web.skype.com ; Log In and follow the instructions to enable your account!"
}
