# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

CRATES="
	ahash-0.7.6
	aho-corasick-0.7.20
	android_system_properties-0.1.5
	anes-0.1.6
	ansi-to-tui-3.0.0
	anstyle-0.3.5
	anyhow-1.0.70
	arrayvec-0.7.2
	assert_cmd-2.0.10
	atty-0.2.14
	autocfg-1.1.0
	beef-0.5.2
	bitflags-1.3.2
	bstr-0.2.17
	bstr-1.4.0
	bumpalo-3.12.0
	cassowary-0.3.0
	cast-0.3.0
	cc-1.0.79
	cfg-if-1.0.0
	chrono-0.4.24
	ciborium-0.2.0
	ciborium-io-0.2.0
	ciborium-ll-0.2.0
	clap-3.2.23
	clap_lex-0.2.4
	codespan-reporting-0.11.1
	core-foundation-sys-0.8.3
	criterion-0.4.0
	criterion-plot-0.5.0
	crossbeam-0.8.2
	crossbeam-channel-0.5.7
	crossbeam-deque-0.8.3
	crossbeam-epoch-0.9.14
	crossbeam-queue-0.3.8
	crossbeam-utils-0.8.15
	crossterm-0.26.1
	crossterm_winapi-0.9.0
	cxx-1.0.93
	cxx-build-1.0.93
	cxxbridge-flags-1.0.93
	cxxbridge-macro-1.0.93
	darling-0.14.4
	darling_core-0.14.4
	darling_macro-0.14.4
	defer-drop-1.3.0
	derive_builder-0.11.2
	derive_builder_core-0.11.2
	derive_builder_macro-0.11.2
	difflib-0.4.0
	dirs-5.0.0
	dirs-next-2.0.0
	dirs-sys-0.4.0
	dirs-sys-next-0.1.2
	doc-comment-0.3.3
	either-1.8.1
	env_logger-0.9.3
	erased-serde-0.3.25
	fnv-1.0.7
	fuzzy-matcher-0.3.7
	gethostname-0.4.1
	getrandom-0.2.8
	half-1.8.2
	hashbrown-0.12.3
	hermit-abi-0.1.19
	hermit-abi-0.2.6
	humansize-2.1.3
	humantime-2.1.0
	iana-time-zone-0.1.54
	iana-time-zone-haiku-0.1.1
	ident_case-1.0.1
	indexmap-1.9.3
	itertools-0.10.5
	itoa-1.0.6
	js-sys-0.3.61
	lazy_static-1.4.0
	libc-0.2.140
	libm-0.2.6
	link-cplusplus-1.0.8
	lock_api-0.4.9
	log-0.4.17
	lscolors-0.13.0
	lua-src-544.0.1
	luajit-src-210.4.5+resty2cf5186
	memchr-2.5.0
	memoffset-0.6.5
	memoffset-0.8.0
	mime-0.3.17
	mime_guess-2.0.4
	minimal-lexical-0.2.1
	mio-0.8.6
	mlua-0.8.8
	natord-1.0.9
	nix-0.24.3
	nix-0.25.1
	nom-7.1.3
	nu-ansi-term-0.46.0
	nu-ansi-term-0.47.0
	num-integer-0.1.45
	num-traits-0.2.15
	num_cpus-1.15.0
	num_threads-0.1.6
	once_cell-1.17.1
	oorandom-11.1.3
	os_str_bytes-6.5.0
	overload-0.1.1
	parking_lot-0.12.1
	parking_lot_core-0.9.7
	path-absolutize-3.0.14
	path-dedot-3.0.18
	pin-utils-0.1.0
	pkg-config-0.3.26
	plotters-0.3.4
	plotters-backend-0.3.4
	plotters-svg-0.3.3
	predicates-3.0.2
	predicates-core-1.0.6
	predicates-tree-1.0.9
	proc-macro2-1.0.53
	quote-1.0.26
	ratatui-0.20.1
	rayon-1.7.0
	rayon-core-1.11.0
	redox_syscall-0.2.16
	redox_users-0.4.3
	regex-1.7.3
	regex-automata-0.1.10
	regex-syntax-0.6.29
	rustc-hash-1.1.0
	rustversion-1.0.12
	ryu-1.0.13
	same-file-1.0.6
	scopeguard-1.1.0
	scratch-1.0.5
	serde-1.0.158
	serde_derive-1.0.158
	serde_json-1.0.94
	serde_yaml-0.9.19
	shlex-1.1.0
	signal-hook-0.3.15
	signal-hook-mio-0.2.3
	signal-hook-registry-1.4.1
	skim-0.10.4
	smallvec-1.10.0
	smawk-0.3.1
	snailquote-0.3.1
	strsim-0.10.0
	syn-1.0.109
	syn-2.0.10
	term-0.7.0
	termcolor-1.2.0
	termtree-0.4.1
	textwrap-0.16.0
	thiserror-1.0.40
	thiserror-impl-1.0.40
	thread_local-1.1.7
	time-0.1.45
	time-0.3.20
	time-core-0.1.0
	time-macros-0.2.8
	timer-0.2.0
	tinytemplate-1.2.1
	tui-input-0.7.0
	tuikit-0.5.0
	unicase-2.6.0
	unicode-ident-1.0.8
	unicode-linebreak-0.1.4
	unicode-segmentation-1.10.1
	unicode-width-0.1.10
	unicode_categories-0.1.1
	unsafe-libyaml-0.2.7
	utf8parse-0.2.1
	version_check-0.9.4
	vte-0.11.0
	vte_generate_state_changes-0.1.1
	wait-timeout-0.2.0
	walkdir-2.3.3
	wasi-0.10.0+wasi-snapshot-preview1
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.84
	wasm-bindgen-backend-0.2.84
	wasm-bindgen-macro-0.2.84
	wasm-bindgen-macro-support-0.2.84
	wasm-bindgen-shared-0.2.84
	web-sys-0.3.61
	which-4.4.0
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-0.43.0
	windows-0.46.0
	windows-sys-0.45.0
	windows-targets-0.42.2
	windows_aarch64_gnullvm-0.42.2
	windows_aarch64_msvc-0.42.2
	windows_i686_gnu-0.42.2
	windows_i686_msvc-0.42.2
	windows_x86_64_gnu-0.42.2
	windows_x86_64_gnullvm-0.42.2
	windows_x86_64_msvc-0.42.2
"

inherit cargo desktop lua-single xdg-utils

DESCRIPTION="A hackable, minimal, fast TUI file explorer"
HOMEPAGE="https://github.com/sayanarijit/xplr"
SRC_URI="
	https://github.com/sayanarijit/xplr/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris)
"

LICENSE="
	|| ( Apache-2.0 )
	|| ( BSD )
	|| ( MIT )
	|| ( Unlicense )
	Apache-2.0
	BSD
	MIT
	Unlicense
"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

REQUIRED_USE="${LUA_REQUIRED_USE}"
RDEPEND="
	${LUA_DEPS}
"
DEPEND="
	${RDEPEND}
"

QA_FLAGS_IGNORED="usr/bin/.*"

src_configure() {
	cargo_src_configure --bin xplr
}

src_prepare() {
	sed -i Cargo.toml -e "s/'vendored', //" || die
	# for dynamic linking with lua
	default
}

src_compile() {
	cargo_src_compile
}

src_install() {
	if use doc; then
		dodoc README.md
		dodc -r docs/*
		einstalldocs
	fi
	dobin target/$(usex debug debug release)/xplr
	newicon -s 16 assets/icon/${PN}16.png ${PN}.png
	newicon -s 32 assets/icon/${PN}32.png ${PN}.png
	newicon -s 64 assets/icon/${PN}64.png ${PN}.png
	newicon -s 128 assets/icon/${PN}128.png ${PN}.png
	doicon -s scalable assets/icon/${PN}.svg
	domenu assets/desktop/xplr.desktop
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
