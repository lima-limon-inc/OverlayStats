# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# not usable currently, need a minor patch

EAPI=8

inherit cmake git-r3 flag-o-matic

DESCRIPTION="Interactive C++ interpreter, built on the top of LLVM and Clang libraries"
HOMEPAGE="https://root.cern/cling/"

EGIT_OVERRIDE_REPO_LLVM_CLING="http://root.cern/git/llvm.git"
EGIT_OVERRIDE_BRANCH_LLVM_CLING="cling-patches"
EGIT_OVERRIDE_COMMIT_LLVM_CLING="ac712f"
EGIT_OVERRIDE_REPO_CLING="http://root.cern/git/cling.git"
EGIT_OVERRIDE_COMMIT_CLING="da247b"
EGIT_OVERRIDE_REPO_CLANG_CLING="http://root.cern/git/clang.git"
EGIT_OVERRIDE_BRANCH_CLANG_CLING="cling-patches"
EGIT_OVERRIDE_COMMIT_CLANG_CLING="25f804"

LICENSE="Apache-2.0" # more
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"
PATCHES=( "${FILESDIR}/cling-disable-cling-demo.patch" 
	"${FILESDIR}/cling-add-missing-header.patch" )

src_unpack() {
	git-r3_fetch llvm-cling
	git-r3_checkout llvm-cling "${WORKDIR}/${P}"
	git-r3_fetch cling
	git-r3_checkout cling "${WORKDIR}/${P}/tools/cling"
	git-r3_fetch clang-cling
	git-r3_checkout clang-cling "${WORKDIR}/${P}/tools/clang"
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="/opt/cling"
		-DCMAKE_BUILD_TYPE=Release
		-DLLVM_BUILD_TOOLS=ON
		-DLLVM_TARGETS_TO_BUILD="host;NVPTX"
		-DLLVM_ENABLE_OCAMLDOC=OFF
		-DLLVM_ENABLE_BINDINGS=OFF
		-DLLVM_INCLUDE_DOCS=OFF
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	dosym ../cling/bin/cling "/opt/bin/cling"
}
