# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

#generated using "cargo ebuild"
CRATES="
findomain-${PV}
addr2line-0.14.0
adler-0.2.3
aho-corasick-0.7.15
ansi_term-0.11.0
arrayvec-0.5.2
async-trait-0.1.42
atty-0.2.14
autocfg-1.0.1
backtrace-0.3.55
base64-0.11.0
base64-0.13.0
bitflags-1.2.1
block-buffer-0.9.0
bumpalo-3.4.0
byteorder-1.3.4
bytes-0.5.6
bytes-0.6.0
cc-1.0.66
cfg-if-0.1.10
cfg-if-1.0.0
clap-2.33.3
config-0.10.1
console_error_panic_hook-0.1.6
const_fn-0.4.4
core-foundation-0.9.1
core-foundation-sys-0.8.2
cpuid-bool-0.1.2
crossbeam-channel-0.5.0
crossbeam-deque-0.8.0
crossbeam-epoch-0.9.1
crossbeam-utils-0.8.1
crypto-mac-0.9.1
digest-0.9.0
either-1.6.1
encoding_rs-0.8.26
enum-as-inner-0.3.3
failure-0.1.8
failure_derive-0.1.8
fallible-iterator-0.2.0
fnv-1.0.7
foreign-types-0.3.2
foreign-types-shared-0.1.1
form_urlencoded-1.0.0
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
futures-0.3.8
futures-channel-0.3.8
futures-core-0.3.8
futures-executor-0.3.8
futures-io-0.3.8
futures-macro-0.3.8
futures-sink-0.3.8
futures-task-0.3.8
futures-util-0.3.8
generic-array-0.14.4
getrandom-0.1.15
gimli-0.23.0
h2-0.2.7
hashbrown-0.9.1
heck-0.3.1
hermit-abi-0.1.17
hmac-0.9.0
hostname-0.3.1
http-0.2.1
http-body-0.3.1
httparse-1.3.4
httpdate-0.3.2
hyper-0.13.9
hyper-tls-0.4.3
idna-0.2.0
indexmap-1.6.0
instant-0.1.9
iovec-0.1.4
ipconfig-0.2.2
ipnet-2.3.0
itoa-0.4.6
js-sys-0.3.46
kernel32-sys-0.2.2
lazy_static-1.4.0
lexical-core-0.7.4
libc-0.2.81
linked-hash-map-0.3.0
linked-hash-map-0.5.3
lock_api-0.4.2
log-0.4.11
lru-cache-0.1.2
match_cfg-0.1.0
matches-0.1.8
md5-0.7.0
memchr-2.3.4
memoffset-0.6.1
mime-0.3.16
mime_guess-2.0.3
miniz_oxide-0.4.3
mio-0.6.23
mio-0.7.6
miow-0.2.2
miow-0.3.6
native-tls-0.2.6
net2-0.2.37
nom-5.1.2
ntapi-0.3.6
num-traits-0.1.43
num-traits-0.2.14
num_cpus-1.13.0
object-0.22.0
once_cell-1.5.2
opaque-debug-0.3.0
openssl-0.10.31
openssl-probe-0.1.2
openssl-src-111.13.0+1.1.1i
openssl-sys-0.9.59
parking_lot-0.11.1
parking_lot_core-0.8.1
percent-encoding-2.1.0
pest-2.1.3
phf-0.8.0
phf_shared-0.8.0
pin-project-0.4.27
pin-project-1.0.2
pin-project-internal-0.4.27
pin-project-internal-1.0.2
pin-project-lite-0.1.11
pin-project-lite-0.2.0
pin-utils-0.1.0
pkg-config-0.3.19
postgres-0.18.1
postgres-protocol-0.5.3
postgres-types-0.1.3
ppv-lite86-0.2.10
proc-macro-hack-0.5.19
proc-macro-nested-0.1.6
proc-macro2-1.0.24
quick-error-1.2.3
quote-1.0.7
rand-0.7.3
rand_chacha-0.2.2
rand_core-0.5.1
rand_hc-0.2.0
rayon-1.5.0
rayon-core-1.9.0
redox_syscall-0.1.57
regex-1.4.2
regex-syntax-0.6.21
remove_dir_all-0.5.3
reqwest-0.10.9
resolv-conf-0.7.0
ring-0.16.19
rust-ini-0.13.0
rustc-demangle-0.1.18
rustls-0.17.0
ryu-1.0.5
schannel-0.1.19
scoped-tls-1.0.0
scopeguard-1.1.0
sct-0.6.0
security-framework-2.0.0
security-framework-sys-2.0.0
semver-0.11.0
semver-parser-0.10.1
serde-0.8.23
serde-1.0.118
serde-hjson-0.9.1
serde_derive-1.0.118
serde_json-1.0.60
serde_test-0.8.23
serde_urlencoded-0.7.0
sha2-0.9.2
siphasher-0.3.3
slab-0.4.2
smallvec-1.5.1
socket2-0.3.17
spin-0.5.2
static_assertions-1.1.0
stringprep-0.1.2
strsim-0.8.0
subtle-2.3.0
syn-1.0.54
synstructure-0.12.4
tempfile-3.1.0
textwrap-0.11.0
thiserror-1.0.22
thiserror-impl-1.0.22
thread_local-1.0.1
tinyvec-1.1.0
tinyvec_macros-0.1.0
tokio-0.2.24
tokio-0.3.5
tokio-postgres-0.6.0
tokio-rustls-0.13.1
tokio-tls-0.3.1
tokio-util-0.3.1
tokio-util-0.4.0
toml-0.5.7
tower-service-0.3.0
tracing-0.1.22
tracing-core-0.1.17
tracing-futures-0.2.4
trust-dns-proto-0.19.6
trust-dns-resolver-0.19.6
trust-dns-rustls-0.19.6
try-lock-0.2.3
typenum-1.12.0
ucd-trie-0.1.3
unicase-2.6.0
unicode-bidi-0.3.4
unicode-normalization-0.1.16
unicode-segmentation-1.7.1
unicode-width-0.1.8
unicode-xid-0.2.1
untrusted-0.7.1
url-2.2.0
vcpkg-0.2.11
vec_map-0.8.2
version_check-0.9.2
want-0.3.0
wasi-0.9.0+wasi-snapshot-preview1
wasm-bindgen-0.2.69
wasm-bindgen-backend-0.2.69
wasm-bindgen-futures-0.4.19
wasm-bindgen-macro-0.2.69
wasm-bindgen-macro-support-0.2.69
wasm-bindgen-shared-0.2.69
wasm-bindgen-test-0.3.19
wasm-bindgen-test-macro-0.3.19
web-sys-0.3.46
webpki-0.21.4
webpki-roots-0.19.0
widestring-0.4.3
winapi-0.2.8
winapi-0.3.9
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
winreg-0.6.2
winreg-0.7.0
ws2_32-sys-0.2.1
yaml-rust-0.3.5
yaml-rust-0.4.4
"

inherit cargo

DESCRIPTION="The fastest and cross-platform subdomain enumerator, don't waste your time"
HOMEPAGE="https://github.com/Edu4rdSHL/findomain"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Edu4rdSHL/findomain"
else
	KEYWORDS="~amd64 ~x86"
	SRC_URI="$(cargo_crate_uris ${CRATES})"
fi

LICENSE="GPL-3"
SLOT="0"

BDEPEND="virtual/rust"

src_unpack() {
	if [[ ${PV} == *9999 ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}

src_install() {
	dobin target/release/findomain

	doman findomain.1
	dodoc -r docs/* docker/ README.md
}
