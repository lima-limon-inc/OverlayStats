# Copyright 2019-2028 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

COMMIT="7375ba5bb0df87c68e58ad15e9e5e351ae020c08"

inherit autotools flag-o-matic toolchain-funcs

DESCRIPTION="A Multicast/Reduction Network"
HOMEPAGE="http://www.paradyn.org/mrnet"
SRC_URI="https://github.com/dyninst/mrnet/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="libi slurm threadsafe"

RDEPEND="
	dev-libs/boost:=
	libi? (
		sys-cluster/launchmon
		sys-cluster/libi
	)
"
DEPEND="
	${RDEPEND}
	slurm? ( sys-cluster/slurm )
"

PATCHES=(
	"${FILESDIR}/${P}-respect-AR-CFLAGS.patch"
	"${FILESDIR}/${P}-respect-LDFLAGS.patch"
	"${FILESDIR}/${PN}-no-libi.patch"
)
REQUIRED_USE="slurm? ( libi )"

src_prepare() {
	tc-export AR CC CXX
	rm -r external || die
	default
	pushd conf || die
	mv configure.{in,ac} || die
	eautoreconf
	popd || die
	mv conf/configure configure || die
}

src_configure() {
	use libi && append-cxxflags "-llibi"
	local myconf=(
		--enable-shared
		--enable-verbosebuild
		--with-boost="${EPREFIX}/usr"

		$(use_enable threadsafe ltwt-threadsafe)
	)

	if use libi; then
		myconf+=( "--with-launchmon=${EPREFIX}/usr" )
		myconf+=( "--with-libi=${EPREFIX}/usr" )
		myconf+=( "--with-startup=libi" )
		use slurm && myconf+=( "--with-libi-startup=slurm" )
	else
		myconf+=( "--without-launchmon" )
		myconf+=( "--without-libi" )
		myconf+=( "--with-startup=ssh" )
	fi

	econf "${myconf[@]}"
}

src_compile() {
	MAKEOPTS="-j1" emake
}

src_install() {
	dolib.so build/*/lib/*.so*
	dobin build/*/bin/*
	insinto /usr/include
	doins -r xplat/include/*
	doins -r include/mrnet*
	doheader build/*/*.h
	dodoc README ACKNOWLEDGMENTS
}
