# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line-0.19.0
	adler-1.0.2
	ahash-0.7.6
	aho-corasick-0.7.20
	android_system_properties-0.1.5
	async-broadcast-0.4.1
	async-channel-1.8.0
	async-executor-1.5.1
	async-io-1.13.0
	async-lock-2.7.0
	async-recursion-0.3.2
	async-task-4.4.0
	async-trait-0.1.68
	atty-0.2.14
	autocfg-1.1.0
	backtrace-0.3.67
	base64-0.21.0
	bitflags-1.3.2
	block-0.1.6
	bumpalo-3.12.1
	byteorder-1.4.3
	bytes-1.4.0
	cc-1.0.79
	cfg-if-1.0.0
	chrono-0.4.24
	clap-3.1.18
	clap_complete-3.1.4
	clap_derive-3.1.18
	clap_lex-0.2.4
	clap_mangen-0.1.7
	codespan-reporting-0.11.1
	color-eyre-0.6.2
	color-spantrace-0.2.0
	concurrent-queue-2.2.0
	console-0.15.5
	core-foundation-sys-0.8.4
	crc32fast-1.3.2
	crossbeam-utils-0.8.15
	cxx-1.0.94
	cxx-build-1.0.94
	cxxbridge-flags-1.0.94
	cxxbridge-macro-1.0.94
	derivative-2.2.0
	dirs-4.0.0
	dirs-next-2.0.0
	dirs-sys-0.3.7
	dirs-sys-next-0.1.2
	dlv-list-0.3.0
	either-1.8.1
	encode_unicode-0.3.6
	encoding_rs-0.8.32
	enumflags2-0.7.7
	enumflags2_derive-0.7.7
	errno-0.3.1
	errno-dragonfly-0.1.2
	etcetera-0.8.0
	event-listener-2.5.3
	eyre-0.6.8
	fastrand-1.9.0
	filetime-0.2.21
	flate2-1.0.26
	fnv-1.0.7
	form_urlencoded-1.1.0
	futures-0.3.28
	futures-channel-0.3.28
	futures-core-0.3.28
	futures-executor-0.3.28
	futures-io-0.3.28
	futures-lite-1.13.0
	futures-macro-0.3.28
	futures-sink-0.3.28
	futures-task-0.3.28
	futures-util-0.3.28
	getrandom-0.2.9
	gimli-0.27.2
	glob-0.3.1
	h2-0.3.18
	hashbrown-0.12.3
	heck-0.3.3
	heck-0.4.1
	hermit-abi-0.1.19
	hermit-abi-0.2.6
	hermit-abi-0.3.1
	hex-0.4.3
	home-0.5.5
	http-0.2.9
	http-body-0.4.5
	httparse-1.8.0
	httpdate-1.0.2
	hyper-0.14.26
	hyper-rustls-0.23.2
	iana-time-zone-0.1.56
	iana-time-zone-haiku-0.1.1
	idna-0.3.0
	indenter-0.3.3
	indexmap-1.9.3
	indicatif-0.16.2
	instant-0.1.12
	io-lifetimes-1.0.10
	ipnet-2.7.2
	itoa-1.0.6
	js-sys-0.3.61
	lazy_static-1.4.0
	libc-0.2.142
	link-cplusplus-1.0.8
	linux-raw-sys-0.3.6
	lock_api-0.4.9
	log-0.4.17
	mac-notification-sys-0.5.6
	malloc_buf-0.0.6
	matchers-0.1.0
	memchr-2.5.0
	memoffset-0.6.5
	mime-0.3.17
	miniz_oxide-0.6.2
	miniz_oxide-0.7.1
	mio-0.8.6
	nix-0.23.2
	nix-0.24.3
	notify-rust-4.5.10
	nu-ansi-term-0.46.0
	num-integer-0.1.45
	num-traits-0.2.15
	num_cpus-1.15.0
	number_prefix-0.4.0
	objc-0.2.7
	objc-foundation-0.1.1
	objc_id-0.1.1
	object-0.30.3
	once_cell-1.17.1
	ordered-multimap-0.4.3
	ordered-stream-0.0.1
	os_str_bytes-6.5.0
	overload-0.1.1
	owo-colors-3.5.0
	parking-2.1.0
	parking_lot-0.12.1
	parking_lot_core-0.9.7
	parselnk-0.1.1
	percent-encoding-2.2.0
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	polling-2.8.0
	ppv-lite86-0.2.17
	proc-macro-crate-1.3.1
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.56
	quick-xml-0.22.0
	quick-xml-0.23.1
	quote-1.0.26
	rand-0.8.5
	rand_chacha-0.3.1
	rand_core-0.6.4
	redox_syscall-0.2.16
	redox_users-0.4.3
	regex-1.5.6
	regex-automata-0.1.10
	regex-syntax-0.6.29
	remove_dir_all-0.5.3
	reqwest-0.11.17
	ring-0.16.20
	roff-0.2.1
	rust-ini-0.18.0
	rustc-demangle-0.1.23
	rustix-0.37.18
	rustls-0.20.8
	rustls-pemfile-1.0.2
	rustversion-1.0.12
	ryu-1.0.13
	same-file-1.0.6
	scopeguard-1.1.0
	scratch-1.0.5
	sct-0.7.0
	self_update-0.30.0
	semver-1.0.17
	serde-1.0.160
	serde_derive-1.0.160
	serde_json-1.0.96
	serde_repr-0.1.12
	serde_urlencoded-0.7.1
	sha1-0.6.1
	sha1_smol-1.0.0
	sharded-slab-0.1.4
	shell-words-1.1.0
	shellexpand-2.1.2
	signal-hook-registry-1.4.1
	slab-0.4.8
	smallvec-1.10.0
	socket2-0.4.9
	spin-0.5.2
	static_assertions-1.1.0
	strsim-0.10.0
	strum-0.22.0
	strum-0.24.1
	strum_macros-0.22.0
	strum_macros-0.24.3
	syn-1.0.109
	syn-2.0.15
	tar-0.4.38
	tauri-winrt-notification-0.1.0
	tempfile-3.2.0
	termcolor-1.2.0
	textwrap-0.15.2
	thiserror-1.0.40
	thiserror-impl-1.0.40
	thread_local-1.1.7
	time-0.1.45
	time-0.3.20
	time-core-0.1.0
	time-macros-0.2.8
	tinyvec-1.6.0
	tinyvec_macros-0.1.1
	tokio-1.18.5
	tokio-rustls-0.23.4
	tokio-util-0.7.2
	toml-0.5.11
	toml_datetime-0.6.1
	toml_edit-0.19.8
	tower-service-0.3.2
	tracing-0.1.37
	tracing-attributes-0.1.24
	tracing-core-0.1.30
	tracing-error-0.2.0
	tracing-log-0.1.3
	tracing-subscriber-0.3.16
	try-lock-0.2.4
	uds_windows-1.0.2
	unicode-bidi-0.3.13
	unicode-ident-1.0.8
	unicode-normalization-0.1.22
	unicode-segmentation-1.10.1
	unicode-width-0.1.10
	untrusted-0.7.1
	url-2.3.1
	valuable-0.1.0
	version_check-0.9.4
	waker-fn-1.1.0
	walkdir-2.3.3
	want-0.3.0
	wasi-0.10.0+wasi-snapshot-preview1
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.84
	wasm-bindgen-backend-0.2.84
	wasm-bindgen-futures-0.4.34
	wasm-bindgen-macro-0.2.84
	wasm-bindgen-macro-support-0.2.84
	wasm-bindgen-shared-0.2.84
	web-sys-0.3.61
	webpki-0.22.0
	webpki-roots-0.22.6
	which-4.1.0
	widestring-0.4.3
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-0.39.0
	windows-0.48.0
	windows-sys-0.42.0
	windows-sys-0.45.0
	windows-sys-0.48.0
	windows-targets-0.42.2
	windows-targets-0.48.0
	windows_aarch64_gnullvm-0.42.2
	windows_aarch64_gnullvm-0.48.0
	windows_aarch64_msvc-0.39.0
	windows_aarch64_msvc-0.42.2
	windows_aarch64_msvc-0.48.0
	windows_i686_gnu-0.39.0
	windows_i686_gnu-0.42.2
	windows_i686_gnu-0.48.0
	windows_i686_msvc-0.39.0
	windows_i686_msvc-0.42.2
	windows_i686_msvc-0.48.0
	windows_x86_64_gnu-0.39.0
	windows_x86_64_gnu-0.42.2
	windows_x86_64_gnu-0.48.0
	windows_x86_64_gnullvm-0.42.2
	windows_x86_64_gnullvm-0.48.0
	windows_x86_64_msvc-0.39.0
	windows_x86_64_msvc-0.42.2
	windows_x86_64_msvc-0.48.0
	winnow-0.4.4
	winreg-0.10.1
	xattr-0.2.3
	zbus-2.3.2
	zbus_macros-2.3.2
	zbus_names-2.5.0
	zip-0.6.4
	zvariant-3.12.0
	zvariant_derive-3.12.0
	zvariant_utils-1.0.0
"

inherit cargo bash-completion-r1

DESCRIPTION="Upgrade all the things"
HOMEPAGE="https://github.com/topgrade-rs/topgrade"
SRC_URI="
	$(cargo_crate_uris)
	https://github.com/topgrade-rs/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	cargo_src_install

	# Shell completions
	mkdir -p ${S}/completions

	# bash
	${ED}/usr/bin/topgrade --gen-completion bash > ${S}/completions/${PN}.bash
	newbashcomp ${S}/completions/${PN}.bash ${PN}

	# zsh
	${ED}/usr/bin/topgrade --gen-completion zsh > ${S}/completions/_${PN}
	insinto /usr/share/zsh/site-functions
	doins ${S}/completions/_${PN}

	# fish
	${ED}/usr/bin/topgrade --gen-completion fish > ${S}/completions/${PN}.fish
	insinto /usr/share/fish/vendor_completions.d
	doins ${S}/completions/${PN}.fish

	# manpage
	${ED}/usr/bin/topgrade --gen-manpage > ${S}/completions/${PN}.1
	doman ${S}/completions/${PN}.1
}
