# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit multilib-build

DESCRIPTION="Virtual for Rust language compiler"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 ~ppc ~ppc64 ~x86"

BDEPEND=""
RDEPEND="|| ( ~dev-lang/rust-${PV}[${MULTILIB_USEDEP}] ~dev-lang/rust-bin-${PV}[${MULTILIB_USEDEP}] )"
