# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line-0.15.2
	adler-1.0.2
	aho-corasick-0.7.15
	autocfg-1.0.1
	backtrace-0.3.59
	bit-set-0.5.2
	bit-vec-0.6.3
	bitflags-1.3.2
	block-0.1.6
	byteorder-1.4.3
	cc-1.0.68
	cfg-if-1.0.0
	chrono-0.4.19
	clap-2.33.3
	codespan-reporting-0.11.1
	curl-sys-0.4.47+curl-7.79.0
	cxx-1.0.54
	cxx-build-1.0.54
	cxxbridge-flags-1.0.54
	cxxbridge-macro-1.0.54
	fastrand-1.5.0
	fnv-1.0.7
	form_urlencoded-1.0.1
	getrandom-0.2.3
	gettext-rs-0.7.0
	gettext-sys-0.21.0
	gimli-0.24.0
	idna-0.2.3
	instant-0.1.9
	lazy_static-1.4.0
	libc-0.2.102
	libz-sys-1.1.3
	link-cplusplus-1.0.5
	locale_config-0.3.0
	malloc_buf-0.0.6
	matches-0.1.8
	memchr-2.3.4
	minimal-lexical-0.1.2
	miniz_oxide-0.4.4
	natord-1.0.9
	nom-7.0.0
	num-integer-0.1.44
	num-traits-0.2.14
	objc-0.2.7
	objc-foundation-0.1.1
	objc_id-0.1.1
	object-0.24.0
	once_cell-1.8.0
	percent-encoding-2.1.0
	pkg-config-0.3.19
	ppv-lite86-0.2.10
	proc-macro2-1.0.27
	proptest-1.0.0
	quick-error-1.2.3
	quick-error-2.0.1
	quote-1.0.9
	rand-0.8.4
	rand_chacha-0.3.1
	rand_core-0.6.3
	rand_hc-0.3.1
	rand_xorshift-0.3.0
	redox_syscall-0.2.9
	regex-1.4.6
	regex-syntax-0.6.25
	remove_dir_all-0.5.3
	rustc-demangle-0.1.20
	rusty-fork-0.3.0
	scratch-1.0.0
	section_testing-0.0.5
	syn-1.0.73
	tempfile-3.2.0
	termcolor-1.1.2
	textwrap-0.11.0
	time-0.1.43
	tinyvec-1.2.0
	tinyvec_macros-0.1.0
	unicode-bidi-0.3.5
	unicode-normalization-0.1.19
	unicode-width-0.1.9
	unicode-xid-0.2.2
	url-2.2.2
	vcpkg-0.2.15
	version_check-0.9.3
	wait-timeout-0.2.0
	wasi-0.10.2+wasi-snapshot-preview1
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	xdg-2.2.0
"

# order matters, cargo's src_unpack is needed
inherit toolchain-funcs xdg-utils verify-sig cargo

DESCRIPTION="An RSS/Atom feed reader for text terminals"
HOMEPAGE="https://newsboat.org/ https://github.com/newsboat/newsboat"
SRC_URI="
	https://newsboat.org/releases/${PV}/${P}.tar.xz
	verify-sig? ( https://newsboat.org/releases/${PV}/${P}.tar.xz.asc )
	$(cargo_crate_uris ${CRATES})
"

LICENSE="0BSD Apache-2.0 Boost-1.0 CC0-1.0 ISC MIT Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc64 ~x86"
IUSE="doc"
VERIFY_SIG_OPENPGP_KEY_PATH=/usr/share/openpgp-keys/newsboat.asc

RDEPEND="
	>=dev-db/sqlite-3.5:3
	>=dev-libs/json-c-0.11:=
	>=dev-libs/stfl-0.21
	>=net-misc/curl-7.21.6
	dev-libs/libxml2
	dev-libs/openssl
	sys-libs/ncurses:0=[unicode(+)]
	sys-libs/zlib
"
DEPEND="${RDEPEND}
	sys-devel/gettext
"
BDEPEND="
	>=virtual/rust-1.53.0
	doc? ( dev-ruby/asciidoctor )
	verify-sig? ( app-crypt/openpgp-keys-newsboat )
	virtual/awk
	virtual/pkgconfig
"

src_unpack() {
	if use verify-sig; then
		verify-sig_verify_detached "${DISTDIR}/${P}.tar.xz" "${DISTDIR}/${P}.tar.xz.asc"
	fi

	cargo_src_unpack
}

src_configure() {
	local flag
	for flag in -O -g; do
		sed -i Makefile -e "/^BARE_CXXFLAGS\s*=/s/${flag}[^ ]\+//"
	done

	sed -i Makefile -e '/^WARNFLAGS\s*=/s/-Werror//'

	use doc || {
		sed -i Makefile \
			-e '/^all:/s/doc//' \
			-e '/^install:/s/install-docs//'
	}
	./config.sh || die
}

src_compile() {
	export CARGO_HOME="${ECARGO_HOME}"
	emake prefix=/usr CXX="$(tc-getCXX)" \
		AR="$(tc-getAR)" RANLIB="$(tc-getRANLIB)"
}

src_test() {
	# tests require UTF-8 locale
	emake CXX="$(tc-getCXX)" AR="$(tc-getAR)" RANLIB="$(tc-getRANLIB)" check
}

src_install() {
	emake DESTDIR="${ED}" prefix=/usr docdir="/usr/share/doc/${PF}" install
	einstalldocs
}

pkg_postinst(){
	xdg_icon_cache_update
}

pkg_postrm(){
	xdg_icon_cache_update
}
