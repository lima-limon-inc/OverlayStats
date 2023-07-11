# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="grml's zsh setup"
HOMEPAGE="https://grml.org/zsh/"
SRC_URI="https://github.com/grml/grml-etc-core/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE="+man"

DEPEND=""
RDEPEND="app-shells/zsh
	sys-process/procps"

BDEPEND="man? ( app-text/txt2tags )"

S="${WORKDIR}/grml-etc-core-${PV}"

src_compile() {
	use man || return
	cd doc
	default
}

src_install() {
	insinto /etc/zsh
	doins  etc/zsh/{keephack,zshenv,zshrc}

	insinto /etc/skel
	doins etc/skel/.zshrc

	use man && doman doc/grmlzshrc.5

	insinto /usr/share/grml
	doins -r usr_share_grml/zsh
}
