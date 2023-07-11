# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#
# Completely experimental ebuild
# right now it does the bare minimum
# Will complete it as time permits

EAPI=8
inherit go-module bash-completion-r1

DESCRIPTION="The Open Policy Agent is an open source, general-purpose policy engine"
HOMEPAGE="https://www.openpolicyagent.org/"

SRC_URI="https://github.com/open-policy-agent/opa/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

LICENSE="Apache-2.0"
SLOT="0"

#RESTRICT="test"


src_compile() {
	make build
	mv opa_linux_amd64 opa
}

src_install() {
 	dobin opa
}
