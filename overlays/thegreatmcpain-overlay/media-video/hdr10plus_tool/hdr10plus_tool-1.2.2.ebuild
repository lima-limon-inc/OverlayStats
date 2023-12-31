# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.0

EAPI=8

CRATES="
	aho-corasick-0.7.18
	anyhow-1.0.52
	atty-0.2.14
	autocfg-1.0.1
	bitflags-1.3.2
	bitvec-0.22.3
	bitvec_helpers-0.1.1
	bitvec_helpers-1.0.0
	cfg-if-1.0.0
	clap-3.0.5
	clap_derive-3.0.5
	console-0.15.0
	crossbeam-channel-0.5.1
	crossbeam-deque-0.8.1
	crossbeam-epoch-0.9.5
	crossbeam-utils-0.8.5
	either-1.6.1
	encode_unicode-0.3.6
	funty-1.2.0
	hashbrown-0.11.2
	heck-0.4.0
	hermit-abi-0.1.19
	hevc_parser-0.2.1
	hevc_parser-0.3.1
	indexmap-1.7.0
	indicatif-0.16.2
	itoa-1.0.1
	lazy_static-1.4.0
	libc-0.2.112
	memchr-2.4.1
	memoffset-0.6.5
	minimal-lexical-0.2.1
	nom-7.1.0
	num_cpus-1.13.1
	number_prefix-0.4.0
	once_cell-1.9.0
	os_str_bytes-6.0.0
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.36
	quote-1.0.14
	radium-0.6.2
	rayon-1.5.1
	rayon-core-1.9.1
	regex-1.5.4
	regex-syntax-0.6.25
	ryu-1.0.9
	scopeguard-1.1.0
	serde-1.0.133
	serde_derive-1.0.133
	serde_json-1.0.74
	strsim-0.10.0
	syn-1.0.85
	tap-1.0.1
	termcolor-1.1.2
	terminal_size-0.1.17
	textwrap-0.14.2
	unicode-xid-0.2.2
	version_check-0.9.4
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	wyz-0.4.0
"

inherit cargo

DESCRIPTION="CLI utility to work with HDR10+ in HEVC files."

HOMEPAGE="https://github.com/quietvoid/hdr10plus_tool"
SRC_URI="
	$(cargo_crate_uris)
	https://github.com/quietvoid/hdr10plus_tool/archive/${PV}.tar.gz -> ${P}.tar.gz"

# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 Boost-1.0 MIT Unlicense"
SLOT="0"
KEYWORDS="~amd64"
