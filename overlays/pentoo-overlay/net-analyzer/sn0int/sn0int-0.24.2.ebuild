# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.1

EAPI=8

CRATES="
	addr2line-0.17.0
	adler-1.0.2
	adler32-1.2.0
	aho-corasick-0.7.18
	ansi_term-0.12.1
	anyhow-1.0.56
	approx-0.4.0
	arrayref-0.3.6
	as-slice-0.1.5
	asn1-rs-0.3.1
	asn1-rs-derive-0.1.0
	asn1-rs-impl-0.1.0
	atty-0.2.14
	autocfg-0.1.8
	autocfg-1.1.0
	backtrace-0.3.64
	base64-0.9.3
	base64-0.10.1
	base64-0.11.0
	base64-0.12.3
	base64-0.13.0
	bincode-1.3.3
	bindgen-0.56.0
	bitflags-1.3.2
	blake2-0.8.1
	blake2-0.10.4
	block-buffer-0.3.3
	block-buffer-0.7.3
	block-buffer-0.9.0
	block-buffer-0.10.2
	block-padding-0.1.5
	boxxy-0.12.1
	bs58-0.4.0
	bstr-0.2.17
	bufstream-0.1.4
	bumpalo-3.9.1
	byte-tools-0.2.0
	byte-tools-0.3.1
	bytemuck-1.8.0
	byteorder-1.4.3
	bytes-0.4.12
	bytes-1.1.0
	bytesize-1.1.0
	caps-0.5.3
	cc-1.0.73
	cexpr-0.4.0
	cfg-if-0.1.10
	cfg-if-1.0.0
	chrono-0.4.19
	chrootable-https-0.16.0
	clang-sys-1.3.1
	clap-2.34.0
	clipboard-win-4.4.1
	cloudabi-0.0.3
	color_quant-1.1.0
	colored-2.0.0
	convert_case-0.4.0
	cookie-0.11.4
	cookie-0.12.0
	cookie_store-0.7.0
	core-foundation-0.9.3
	core-foundation-sys-0.8.3
	cpufeatures-0.2.2
	crc32fast-1.3.2
	crossbeam-channel-0.5.4
	crossbeam-deque-0.7.4
	crossbeam-deque-0.8.1
	crossbeam-epoch-0.8.2
	crossbeam-epoch-0.9.8
	crossbeam-queue-0.2.3
	crossbeam-utils-0.7.2
	crossbeam-utils-0.8.8
	crypto-common-0.1.3
	crypto-mac-0.7.0
	cssparser-0.27.2
	cssparser-macros-0.6.0
	ct-logs-0.6.0
	ct-logs-0.7.0
	ctrlc-3.2.1
	curl-0.4.43
	curl-sys-0.4.53+curl-7.82.0
	data-encoding-2.3.2
	data-encoding-macro-0.1.12
	data-encoding-macro-internal-0.1.10
	deflate-0.8.6
	der-parser-7.0.0
	derive_more-0.99.17
	devise-0.2.0
	devise_codegen-0.2.0
	devise_core-0.2.0
	diesel-1.4.8
	diesel_derives-1.4.1
	diesel_full_text_search-1.0.1
	diesel_migrations-1.4.0
	digest-0.7.6
	digest-0.8.1
	digest-0.9.0
	digest-0.10.3
	dirs-next-2.0.0
	dirs-sys-next-0.1.2
	displaydoc-0.2.3
	dotenv-0.15.0
	dtoa-0.4.8
	dtoa-short-0.3.3
	ed25519-1.4.1
	either-1.6.1
	embedded-triple-0.1.0
	encoding_rs-0.8.30
	endian-type-0.1.2
	enum-as-inner-0.2.1
	env_logger-0.8.4
	env_logger-0.9.0
	errno-0.2.8
	errno-dragonfly-0.1.2
	error-code-2.3.1
	failure-0.1.8
	failure_derive-0.1.8
	fake-simd-0.1.2
	fastrand-1.7.0
	fd-lock-3.0.5
	filetime-0.2.15
	flate2-1.0.22
	fnv-1.0.7
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	form_urlencoded-1.0.1
	fsevent-0.4.0
	fsevent-sys-2.0.1
	fuchsia-cprng-0.1.1
	fuchsia-zircon-0.3.3
	fuchsia-zircon-sys-0.3.3
	futf-0.1.5
	futures-0.1.31
	futures-cpupool-0.1.8
	fxhash-0.2.1
	generic-array-0.9.1
	generic-array-0.12.4
	generic-array-0.13.3
	generic-array-0.14.5
	geo-0.19.0
	geo-types-0.7.3
	geographiclib-rs-0.2.0
	getrandom-0.1.16
	getrandom-0.2.6
	gif-0.11.3
	gimli-0.26.1
	glob-0.3.0
	h2-0.1.26
	handlebars-1.1.0
	hash32-0.1.1
	hashbrown-0.11.2
	heapless-0.6.1
	heck-0.3.3
	heck-0.4.0
	hermit-abi-0.1.19
	hex-0.4.3
	hlua-badtouch-0.4.2
	hmac-0.12.1
	html5ever-0.25.2
	http-0.1.21
	http-0.2.6
	http-body-0.1.0
	httparse-1.6.0
	humansize-1.1.1
	humantime-1.3.0
	humantime-2.1.0
	hyper-0.10.16
	hyper-0.12.36
	hyper-rustls-0.17.1
	hyper-tls-0.3.2
	idna-0.1.5
	idna-0.2.3
	image-0.23.14
	img_hash_median-4.0.0
	indexmap-1.8.0
	inotify-0.7.1
	inotify-sys-0.1.5
	input_buffer-0.4.0
	instant-0.1.12
	io-lifetimes-0.6.1
	iovec-0.1.4
	ipconfig-0.2.2
	ipnetwork-0.18.0
	itoa-0.4.8
	itoa-1.0.1
	jpeg-decoder-0.1.22
	js-sys-0.3.56
	kamadak-exif-0.5.4
	keccak-0.1.0
	kernel32-sys-0.2.2
	kuchiki-0.8.1
	language-tags-0.2.2
	lazy_static-1.4.0
	lazycell-1.3.0
	libc-0.2.121
	libloading-0.7.3
	libsodium-sys-0.2.7
	libsqlite3-sys-0.22.2
	libz-sys-1.1.5
	line-wrap-0.1.1
	linked-hash-map-0.5.4
	linux-raw-sys-0.0.42
	lock_api-0.3.4
	lock_api-0.4.6
	log-0.3.9
	log-0.4.16
	lru-cache-0.1.2
	lua52-sys-0.1.2
	mac-0.1.1
	maplit-1.0.2
	markup5ever-0.10.1
	matches-0.1.9
	maxminddb-0.22.0
	maybe-uninit-2.0.0
	md-5-0.10.1
	memchr-2.4.1
	memoffset-0.5.6
	memoffset-0.6.5
	migrations_internals-1.4.1
	migrations_macros-1.4.2
	mime-0.2.6
	mime-0.3.16
	mime_guess-2.0.4
	minimal-lexical-0.2.1
	miniz_oxide-0.3.7
	miniz_oxide-0.4.4
	mio-0.6.23
	mio-extras-2.0.6
	mio-uds-0.6.8
	miow-0.2.2
	mqtt-protocol-0.11.2
	mutate_once-0.1.1
	native-tls-0.2.10
	net2-0.2.37
	new_debug_unreachable-1.0.4
	nibble_vec-0.0.4
	nibble_vec-0.1.0
	nix-0.22.3
	nix-0.23.1
	nodrop-0.1.14
	nom-5.1.2
	nom-7.1.1
	notify-4.0.17
	nude-0.3.0
	num-bigint-0.4.3
	num-complex-0.2.4
	num-integer-0.1.44
	num-iter-0.1.42
	num-rational-0.3.2
	num-traits-0.2.14
	num_cpus-1.13.1
	num_threads-0.1.5
	oauth2-2.0.0
	object-0.27.1
	oid-registry-0.4.0
	once_cell-1.10.0
	onig-5.0.0
	onig_sys-69.7.1
	opaque-debug-0.2.3
	opaque-debug-0.3.0
	opener-0.5.0
	openssl-0.10.38
	openssl-probe-0.1.5
	openssl-sys-0.9.72
	os-version-0.2.0
	parking_lot-0.9.0
	parking_lot-0.11.2
	parking_lot-0.12.0
	parking_lot_core-0.6.2
	parking_lot_core-0.8.5
	parking_lot_core-0.9.1
	pdqselect-0.1.0
	pear-0.1.4
	pear_codegen-0.1.4
	peeking_take_while-0.1.2
	pem-1.0.2
	percent-encoding-1.0.1
	percent-encoding-2.1.0
	pest-2.1.3
	pest_derive-2.1.0
	pest_generator-2.1.3
	pest_meta-2.1.3
	phf-0.8.0
	phf_codegen-0.8.0
	phf_generator-0.8.0
	phf_generator-0.10.0
	phf_macros-0.8.0
	phf_shared-0.8.0
	phf_shared-0.10.0
	pkg-config-0.3.24
	pledge-0.4.2
	plist-0.4.2
	plist-1.3.1
	png-0.16.8
	ppv-lite86-0.2.16
	pq-sys-0.4.6
	precomputed-hash-0.1.1
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro-hack-0.5.19
	proc-macro2-0.4.30
	proc-macro2-1.0.36
	psl-types-2.0.10
	publicsuffix-1.5.6
	publicsuffix-2.1.1
	quick-error-1.2.3
	quote-0.6.13
	quote-1.0.17
	r2d2-0.8.9
	radix_trie-0.1.6
	radix_trie-0.2.1
	rand-0.6.5
	rand-0.7.3
	rand-0.8.5
	rand_chacha-0.1.1
	rand_chacha-0.2.2
	rand_chacha-0.3.1
	rand_core-0.3.1
	rand_core-0.4.2
	rand_core-0.5.1
	rand_core-0.6.3
	rand_hc-0.1.0
	rand_hc-0.2.0
	rand_isaac-0.1.1
	rand_jitter-0.1.4
	rand_os-0.1.3
	rand_pcg-0.1.2
	rand_pcg-0.2.1
	rand_xorshift-0.1.1
	rayon-1.5.1
	rayon-core-1.9.1
	rdrand-0.4.0
	redox_syscall-0.1.57
	redox_syscall-0.2.12
	redox_users-0.4.2
	regex-1.5.5
	regex-automata-0.1.10
	regex-syntax-0.6.25
	remove_dir_all-0.5.3
	reqwest-0.9.24
	ring-0.16.20
	robust-0.2.3
	rocket-0.4.10
	rocket_codegen-0.4.10
	rocket_contrib-0.4.10
	rocket_failure-0.2.0
	rocket_failure_errors-0.2.0
	rocket_http-0.4.10
	rstar-0.8.4
	rustc-demangle-0.1.21
	rustc-hash-1.1.0
	rustc_version-0.2.3
	rustc_version-0.4.0
	rustdct-0.4.0
	rustfft-3.0.1
	rusticata-macros-4.1.0
	rustix-0.34.1
	rustls-0.16.0
	rustls-0.18.1
	rustversion-1.0.6
	rustyline-9.1.2
	ryu-1.0.9
	safemem-0.3.3
	same-file-1.0.6
	schannel-0.1.19
	scheduled-thread-pool-0.2.5
	scoped_threadpool-0.1.9
	scopeguard-1.1.0
	sct-0.6.1
	seccomp-sys-0.1.3
	security-framework-2.6.1
	security-framework-sys-2.6.1
	selectors-0.22.0
	semver-0.9.0
	semver-1.0.7
	semver-parser-0.7.0
	separator-0.4.1
	serde-1.0.136
	serde_derive-1.0.136
	serde_json-1.0.79
	serde_urlencoded-0.5.5
	serde_urlencoded-0.7.1
	servo_arc-0.1.1
	sha-1-0.8.2
	sha-1-0.9.8
	sha-1-0.10.0
	sha2-0.7.1
	sha2-0.10.2
	sha3-0.10.1
	shellwords-1.1.0
	shlex-0.1.1
	signature-1.5.0
	siphasher-0.3.10
	slab-0.4.5
	sloppy-rfc4880-0.2.0
	smallvec-0.6.14
	smallvec-1.8.0
	socket2-0.3.19
	socket2-0.4.4
	sodiumoxide-0.2.7
	spin-0.5.2
	stable_deref_trait-1.2.0
	state-0.4.2
	str-buf-1.0.5
	strength_reduce-0.2.3
	string-0.2.1
	string_cache-0.8.4
	string_cache_codegen-0.5.2
	strsim-0.8.0
	structopt-0.3.26
	structopt-derive-0.4.18
	strum-0.21.0
	strum-0.24.0
	strum_macros-0.21.1
	strum_macros-0.24.0
	subtle-1.0.0
	subtle-2.4.1
	syn-0.15.44
	syn-1.0.90
	synstructure-0.12.6
	syntect-3.3.0
	syscallz-0.16.1
	tempfile-3.3.0
	tendril-0.4.3
	termcolor-1.1.3
	textwrap-0.11.0
	thin-slice-0.1.1
	thiserror-1.0.30
	thiserror-impl-1.0.30
	threadpool-1.8.1
	tiff-0.6.1
	time-0.1.43
	time-0.3.9
	time-macros-0.2.4
	tinyvec-1.5.1
	tinyvec_macros-0.1.0
	tokio-0.1.22
	tokio-buf-0.1.1
	tokio-codec-0.1.2
	tokio-current-thread-0.1.7
	tokio-executor-0.1.10
	tokio-fs-0.1.7
	tokio-io-0.1.13
	tokio-reactor-0.1.12
	tokio-rustls-0.10.3
	tokio-sync-0.1.8
	tokio-tcp-0.1.4
	tokio-threadpool-0.1.18
	tokio-timer-0.2.13
	tokio-udp-0.1.6
	tokio-uds-0.2.7
	toml-0.4.10
	toml-0.5.8
	traitobject-0.1.0
	transpose-0.1.0
	transpose-0.2.1
	trust-dns-0.17.0
	trust-dns-proto-0.8.0
	try-lock-0.2.3
	try_from-0.3.2
	tungstenite-0.13.0
	typeable-0.1.2
	typenum-1.15.0
	ucd-trie-0.1.3
	uname-0.1.1
	unicase-1.4.2
	unicase-2.6.0
	unicode-bidi-0.3.7
	unicode-normalization-0.1.19
	unicode-segmentation-1.9.0
	unicode-width-0.1.9
	unicode-xid-0.1.0
	unicode-xid-0.2.2
	untrusted-0.7.1
	unveil-0.3.1
	url-1.7.2
	url-2.2.2
	utf-8-0.7.6
	utf8parse-0.2.0
	uuid-0.7.4
	vcpkg-0.2.15
	vec_map-0.8.2
	version_check-0.1.5
	version_check-0.9.4
	walkdir-2.3.2
	want-0.2.0
	wasi-0.9.0+wasi-snapshot-preview1
	wasi-0.10.2+wasi-snapshot-preview1
	wasm-bindgen-0.2.79
	wasm-bindgen-backend-0.2.79
	wasm-bindgen-macro-0.2.79
	wasm-bindgen-macro-support-0.2.79
	wasm-bindgen-shared-0.2.79
	web-sys-0.3.56
	webpki-0.21.4
	webpki-roots-0.17.0
	webpki-roots-0.18.0
	webpki-roots-0.21.1
	weezl-0.1.5
	which-3.1.1
	widestring-0.4.3
	winapi-0.2.8
	winapi-0.3.9
	winapi-build-0.1.1
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-sys-0.30.0
	windows-sys-0.32.0
	windows_aarch64_msvc-0.30.0
	windows_aarch64_msvc-0.32.0
	windows_i686_gnu-0.30.0
	windows_i686_gnu-0.32.0
	windows_i686_msvc-0.30.0
	windows_i686_msvc-0.32.0
	windows_x86_64_gnu-0.30.0
	windows_x86_64_gnu-0.32.0
	windows_x86_64_msvc-0.30.0
	windows_x86_64_msvc-0.32.0
	winreg-0.6.2
	ws2_32-sys-0.2.1
	x509-parser-0.13.1
	xml-rs-0.8.4
	yaml-rust-0.4.5
	yansi-0.5.1
"

inherit bash-completion-r1 cargo fcaps

DESCRIPTION="Semi-automatic OSINT framework and package manager"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/kpcyrd/sn0int"
SRC_URI="$(cargo_crate_uris ${CRATES})
	https://github.com/kpcyrd/sn0int/archive/refs/tags/v0.24.2.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE="doc"

BDEPEND="
	doc? ( dev-python/sphinx )
	virtual/pkgconfig"

RDEPEND="
	dev-db/sqlite:=
	dev-libs/libsodium:=
	sys-libs/libseccomp"

DEPEND="${RDEPEND}"

src_compile() {
	cargo_src_compile
	target/release/sn0int completions bash > "${T}"/sn0int.bash-completion || die
}

src_install() {
	cargo_src_install

	newbashcomp "${T}"/sn0int.bash-completion $PN

	if use doc; then
		emake docs
		dodoc -r docs/_build/html
	fi

	dodoc *.md Dockerfile contrib/docker/Dockerfile.alpine
}

pkg_postinst() {
	fcaps CAP_SYS_CHROOT /usr/bin/sn0int
}
