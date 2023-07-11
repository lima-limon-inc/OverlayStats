# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp

DESCRIPTION="A Brief emulator for Emacs"
HOMEPAGE="http://xpt.sourceforge.net/tools/brief-mode/"
SRC_URI="mirror://sourceforge/xpt/${P}.tgz"
RESTRICT="mirror"

LICENSE="brief-mode"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DOCS="brief-mode.htm brief-mode.news"

src_prepare() {
	sed -i -e 's:global-set-key \[DEL]:global-set-key [delete]:' "brief-mode.el"
	sed -i -e 's:global-set-key \[M-DEL]:global-set-key [M-delete]:' "brief-mode.el"
	eapply_user
}
