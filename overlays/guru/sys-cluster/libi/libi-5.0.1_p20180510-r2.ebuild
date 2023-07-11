# Copyright 2019-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools toolchain-funcs

COMMIT="7375ba5bb0df87c68e58ad15e9e5e351ae020c08"

DESCRIPTION="A framework for bootstrapping extreme scale software systems"
HOMEPAGE="http://www.paradyn.org/mrnet/"
SRC_URI="https://github.com/dyninst/mrnet/archive/${COMMIT}.tar.gz -> ${P/libi/mrnet}.tar.gz"
S="${WORKDIR}/mrnet-${COMMIT}/external/libi"

LICENSE="LGPL-2.1"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE="slurm"

RDEPEND="
	sys-cluster/launchmon
	sys-cluster/mrnet
"
DEPEND="
	${RDEPEND}
	slurm? ( sys-cluster/slurm )
"

PATCHES=(
	"${FILESDIR}/${PN}-create-libdir.patch"
	"${FILESDIR}/${PN}-link-launchmon.patch"
	"${FILESDIR}/${PN}-shared-library.patch"
	"${FILESDIR}/${P}-respect-variables.patch"
)

src_prepare() {
	tc-export AR
	default
	pushd conf || die
	mv configure.{in,ac} || die
	eautoreconf
	popd || die
	mv conf/configure configure || die
}

src_configure() {
	local myconf=(
		--enable-shared
		--with-launchmon="${EPREFIX}/usr"
		--with-xplat="${EPREFIX}/usr"
	)

	use slurm && myconf+=( "--with-libi-startup=slurm" )

	econf "${myconf[@]}"
}

src_install() {
	dolib.so ../../build/*/lib/liblibi.so
	insinto /usr/include
	doins -r include/libi
}
