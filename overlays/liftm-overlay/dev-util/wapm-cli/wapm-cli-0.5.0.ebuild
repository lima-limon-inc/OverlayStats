# Copyright 2017-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# rq -tJ <Cargo.lock | jq -r '.package[] | "\(.name)-\(.version)"'
# Not sure if all of these are required
CRATES="
adler32-1.0.4
aho-corasick-0.7.10
ansi_term-0.11.0
arrayref-0.3.6
arrayvec-0.4.12
arrayvec-0.5.1
ascii-0.9.3
async-compression-0.3.1
atty-0.2.14
autocfg-0.1.7
autocfg-1.0.0
backtrace-0.3.45
backtrace-sys-0.1.34
base64-0.10.1
base64-0.11.0
billboard-0.1.0
bincode-1.2.1
bitflags-1.2.1
blake2b_simd-0.5.10
blake3-0.1.5
block-buffer-0.7.3
block-padding-0.1.5
bstr-0.2.11
bumpalo-3.2.0
byte-tools-0.3.1
byteorder-1.3.4
bytes-0.4.12
bytes-0.5.4
cc-1.0.50
cfg-if-0.1.10
chrono-0.4.11
clap-2.33.0
clicolors-control-1.0.1
cloudabi-0.0.3
cmake-0.1.42
colored-1.9.3
combine-3.8.1
console-0.9.2
console-0.10.0
constant_time_eq-0.1.5
cookie-0.12.0
cookie_store-0.7.0
core-foundation-0.7.0
core-foundation-sys-0.7.0
crc32fast-1.2.0
crossbeam-deque-0.7.3
crossbeam-epoch-0.8.2
crossbeam-queue-0.2.1
crossbeam-utils-0.7.2
crypto-mac-0.7.0
csv-1.1.3
csv-core-0.1.10
debugid-0.4.0
dialoguer-0.4.0
digest-0.8.1
dirs-1.0.5
doc-comment-0.3.2
dtoa-0.4.5
either-1.5.3
encode_unicode-0.3.6
encoding_rs-0.8.22
env_logger-0.6.2
error-chain-0.12.2
failure-0.1.7
failure_derive-0.1.7
fake-simd-0.1.2
fallible-iterator-0.2.0
fallible-streaming-iterator-0.1.9
fern-0.6.0
filetime-0.2.8
flate2-1.0.13
fnv-1.0.6
foreign-types-0.3.2
foreign-types-shared-0.1.1
fuchsia-cprng-0.1.1
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
futures-0.1.29
futures-channel-0.3.4
futures-core-0.3.4
futures-cpupool-0.1.8
futures-io-0.3.4
futures-sink-0.3.4
futures-task-0.3.4
futures-util-0.3.4
generic-array-0.12.3
getrandom-0.1.14
glob-0.2.11
graphql-parser-0.2.3
graphql_client-0.8.0
graphql_client_codegen-0.8.0
graphql_query_derive-0.8.0
h2-0.1.26
h2-0.2.2
heck-0.3.1
hermit-abi-0.1.8
hex-0.4.2
hmac-0.7.1
hostname-0.1.5
http-0.1.21
http-0.2.0
http-body-0.1.0
http-body-0.3.1
httparse-1.3.4
httpdate-0.3.2
humantime-1.3.0
hyper-0.12.35
hyper-0.13.3
hyper-tls-0.3.2
hyper-tls-0.4.1
idna-0.1.5
idna-0.2.0
im-12.3.4
indexmap-1.3.2
iovec-0.1.4
itoa-0.4.5
js-sys-0.3.36
kernel32-sys-0.2.2
lazy_static-1.4.0
lexical-core-0.6.2
libc-0.2.67
libsqlite3-sys-0.17.1
license-exprs-1.5.0
linked-hash-map-0.5.2
lock_api-0.3.3
log-0.4.8
lru-cache-0.1.2
maplit-1.0.2
matches-0.1.8
maybe-uninit-2.0.0
memchr-2.3.3
memoffset-0.5.3
mime-0.3.16
mime_guess-2.0.3
minisign-0.5.14
miniz_oxide-0.3.6
mio-0.6.21
miow-0.2.1
native-tls-0.2.4
net2-0.2.33
nodrop-0.1.14
nom-5.1.1
num-integer-0.1.42
num-traits-0.2.11
num_cpus-1.12.0
opaque-debug-0.2.3
openssl-0.10.28
openssl-probe-0.1.2
openssl-src-111.6.1+1.1.1d
openssl-sys-0.9.54
parking_lot-0.9.0
parking_lot_core-0.6.2
pbkdf2-0.3.0
percent-encoding-1.0.1
percent-encoding-2.1.0
pin-project-0.4.8
pin-project-internal-0.4.8
pin-project-lite-0.1.4
pin-utils-0.1.0-alpha.4
pkg-config-0.3.17
ppv-lite86-0.2.6
prettytable-rs-0.8.0
proc-macro-error-0.4.11
proc-macro-error-attr-0.4.11
proc-macro2-0.4.30
proc-macro2-1.0.9
publicsuffix-1.5.4
quick-error-1.2.3
quote-0.6.13
quote-1.0.3
rand-0.6.5
rand-0.7.3
rand_chacha-0.1.1
rand_chacha-0.2.2
rand_core-0.3.1
rand_core-0.4.2
rand_core-0.5.1
rand_hc-0.1.0
rand_hc-0.2.0
rand_isaac-0.1.1
rand_jitter-0.1.4
rand_os-0.1.3
rand_pcg-0.1.2
rand_xorshift-0.1.1
rdrand-0.4.0
redox_syscall-0.1.56
redox_users-0.3.4
regex-1.3.4
regex-automata-0.1.9
regex-syntax-0.6.16
remove_dir_all-0.5.2
reqwest-0.9.24
reqwest-0.10.4
rpassword-4.0.5
rusqlite-0.21.0
rust-argon2-0.7.0
rustc-demangle-0.1.16
rustc_version-0.2.3
ryu-1.0.2
schannel-0.1.17
scopeguard-1.1.0
scrypt-0.2.0
security-framework-0.4.1
security-framework-sys-0.4.1
semver-0.9.0
semver-parser-0.7.0
sentry-0.15.5
sentry-types-0.11.0
serde-1.0.104
serde_derive-1.0.104
serde_json-1.0.48
serde_urlencoded-0.5.5
serde_urlencoded-0.6.1
sha2-0.8.1
sized-chunks-0.1.3
slab-0.4.2
smallvec-0.6.13
smallvec-1.2.0
static_assertions-0.3.4
string-0.2.1
strsim-0.8.0
structopt-0.3.11
structopt-derive-0.4.4
subtle-1.0.0
syn-0.15.44
syn-1.0.16
syn-mid-0.5.0
synstructure-0.12.3
tar-0.4.26
tempfile-3.1.0
term-0.5.2
term_size-0.3.1
termcolor-1.1.0
termios-0.3.1
textwrap-0.11.0
thiserror-1.0.11
thiserror-impl-1.0.11
thread_local-1.0.1
time-0.1.42
tokio-0.1.22
tokio-0.2.13
tokio-buf-0.1.1
tokio-current-thread-0.1.7
tokio-executor-0.1.10
tokio-io-0.1.13
tokio-reactor-0.1.12
tokio-sync-0.1.8
tokio-tcp-0.1.4
tokio-threadpool-0.1.18
tokio-timer-0.2.13
tokio-tls-0.3.0
tokio-util-0.2.0
toml-0.5.6
tower-service-0.3.0
try-lock-0.2.2
try_from-0.3.2
typenum-1.11.2
uname-0.1.1
unicase-2.6.0
unicode-bidi-0.3.4
unicode-normalization-0.1.12
unicode-segmentation-1.6.0
unicode-width-0.1.7
unicode-xid-0.1.0
unicode-xid-0.2.0
unreachable-1.0.0
url-1.7.2
url-2.1.1
url_serde-0.2.0
uuid-0.7.4
vcpkg-0.2.8
vec_map-0.8.1
version_check-0.9.1
void-1.0.2
wabt-0.7.4
wabt-sys-0.5.4
want-0.2.0
want-0.3.0
wasi-0.9.0+wasi-snapshot-preview1
wasm-bindgen-0.2.59
wasm-bindgen-backend-0.2.59
wasm-bindgen-futures-0.4.9
wasm-bindgen-macro-0.2.59
wasm-bindgen-macro-support-0.2.59
wasm-bindgen-shared-0.2.59
wasm-interface-0.1.0
wasmparser-0.51.4
web-sys-0.3.36
whoami-0.5.3
winapi-0.2.8
winapi-0.3.8
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.3
winapi-x86_64-pc-windows-gnu-0.4.0
winreg-0.6.2
winutil-0.1.1
ws2_32-sys-0.2.1
xattr-0.2.2
"

inherit cargo

DESCRIPTION="WebAssembly Package Manager "
HOMEPAGE="https://wasmer.io"
SRC_URI="https://github.com/wasmerio/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})"

LICENSE="MIT Apache-2.0 BSD-2 ISC"
SLOT="0"
KEYWORDS="~amd64"
IUSE="
+system-sqlite
telemetry
update-notifications
prehash-module
+packagesigning
"
REQUIRED_USE=""

BDEPEND="
	>=virtual/rust-1.37.0
"
# rust version is probably not sufficient, but wasmer doesn't indicate a minimum

src_prepare() {
	[[ "${PV}" == *9999* ]] || ln -s ../${P}-git-deps "${ECARGO_HOME}"/git
	default
}

puf() {
	usex $1 $1 ""
}

cargo_do() {
	cmd=$1
	shift
	cargo_$cmd \
		--no-default-features \
		--features "
			$(usex system-sqlite "" sqlite-bundled)
			$(puf telemetry)
			$(puf update-notifications)
			$(puf prehash-module)
			$(puf packagesigning)
		" "$@"
}

src_compile() {
	cargo_do src_compile
}

src_install() {
	cargo_do src_install
	einstalldocs
}
