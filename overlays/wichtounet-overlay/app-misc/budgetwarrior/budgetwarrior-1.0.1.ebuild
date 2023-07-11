# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

DESCRIPTION="budgetwarrior, a simple command line personal accounting utility"
HOMEPAGE="http://www.github.com/wichtounet/budgetwarrior/"

inherit eutils

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-libs/openssl"
DEPEND="${RDEPEND}"

SRC_URI="https://github.com/wichtounet/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

src_compile(){
	emake
}

src_install() {
	dobin release/bin/budget

	cp budget.man budget.1
	doman budget.1

	insinto /usr/share/bash/bash_completions/
	newins completions/bash budget

	insinto /usr/share/zsh/site-functions/
	newins completions/zsh _budget
}
