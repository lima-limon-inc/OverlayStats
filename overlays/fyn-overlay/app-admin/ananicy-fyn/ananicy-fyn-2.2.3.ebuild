# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} pypy3 )

inherit python-single-r1

DESCRIPTION="ANother Auto NICe daemon(fork version)"
HOMEPAGE="https://github.com/qwe795138426/Ananicy"
SRC_URI="https://github.rc1844.workers.dev/qwe795138426/Ananicy/archive/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/Ananicy-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	sys-process/schedtool"
BDEPEND="${PYTHON_DEPS}"

DOCS=( README.md )

PATCHES=(
	"${FILESDIR}/ananicy-fix-sysctl-path.patch"
)

src_compile() {
	return
}

src_install() {
	emake PREFIX="${D}" install

	python_fix_shebang "${ED}"/usr/bin/ananicy
	doinitd "${FILESDIR}"/ananicy.initd

	einstalldocs
}

