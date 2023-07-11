# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="OXEN Wallet & Daemon"

HOMEPAGE="https://oxen.io"

EGIT_REPO_URI='https://github.com/oxen-io/oxen-core'
EGIT_COMMIT="v${PV}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 ~x86 ~arm64 ~arm ~mips ~mips64 ~ppc64"
IUSE="coverage daemon doc readline"

DEPEND="dev-vcs/git
    dev-util/cmake
    dev-util/pkgconf
    >=dev-libs/boost-1.65
    dev-libs/openssl
    net-misc/curl
    sys-libs/libunwind
    >=net-dns/unbound-1.4.16
    net-libs/oxenmq
    dev-db/sqlite:3
    app-arch/xz-utils
    >=sys-libs/readline-6.3.0
    >=net-libs/ldns-1.6.17
    >=dev-libs/expat-1.1
    app-doc/doxygen
    dev-qt/linguist-tools:5
    dev-libs/hidapi
    dev-libs/libusb
    dev-libs/protobuf
    >=net-libs/miniupnpc-2.1
    virtual/libcrypt
    acct-user/oxen
    acct-group/oxen"

RDEPEND="${DEPEND}"

src_prepare() {
    cmake_src_prepare
}

src_configure() {

    local mycmakeargs=(
        -DWARNINGS_AS_ERRORS=ON
        -DBUILD_DOCUMENTATION=$(usex doc ON OFF)
        -DBUILD_TESTS=OFF # $(usex test ON OFF)
        # -DBUILD_64=$(usex ... detect 64/32 bit arch here ...)
		# Off for now ...
        -DBUILD_SHARED_LIBS=OFF
        -DCOVERAGE=$(usex coverage ON OFF)
        -DUSE_READLINE=$(usex readline ON OFF)
		-DCMAKE_CXX_FLAGS="-Wno-stringop-overflow -Wno-return-type"
    )

    cmake_src_configure
}

src_install() {
    if use daemon; then
        # OpenRC
        newconfd "${FILESDIR}/oxend.conf" oxend
        newinitd "${FILESDIR}/oxend.init" oxend

        insinto /etc/oxen
        newins "${FILESDIR}/oxend.oxend.conf" oxend.conf

        # systemd
        systemd_newunit "${FILESDIR}/oxend.service" oxend.service
    fi

    cmake_src_install
}
