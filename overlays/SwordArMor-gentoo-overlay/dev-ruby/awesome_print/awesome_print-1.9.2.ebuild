# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31"

inherit ruby-fakegem

DESCRIPTION="Pretty print your Ruby objects with style"
HOMEPAGE="https://github.com/awesome-print/awesome_print"
SRC_URI="https://github.com/awesome-print/awesome_print/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
