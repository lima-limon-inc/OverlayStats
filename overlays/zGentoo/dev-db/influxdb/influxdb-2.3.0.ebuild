# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module systemd
#go-module_set_globals

DESCRIPTION="Scalable datastore for metrics, events, and real-time analytics"
HOMEPAGE="https://www.influxdata.com/products/influxdb-overview/"
SRC_URI="
    https://github.com/influxdata/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
    https://vendors.retarded.farm/${PN}/vendor-${P}.tar.xz
    https://vendors.retarded.farm/${PN}/vendor-libflux-0.171.0.tar.xz
    https://github.com/influxdata/ui/releases/download/OSS-2.1.2/build.tar.gz -> ${P}-build.tar.gz
    https://github.com/influxdata/openapi/archive/refs/tags/${PN}-oss-v${PV}.tar.gz -> ${P}-openapi.tar.gz
"
# >> go mod vendor && mkdir influxdb-<version> && mv vendor influxdb-<version>/vendor \
# >> tar -c -I 'xz -9 -T0' -f vendor-influxdb-<version>.tar.xz influxdb-<version>/vendor
LICENSE="MIT BSD Apache-2.0 EPL-1.0 MPL-2.0 BSD-2 ISC"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+client telegraf"

BDEPEND="virtual/rust
    dev-libs/protobuf"
COMMON_DEPEND="
    acct-group/${PN}
    acct-user/${PN}"
DEPEND="${COMMON_DEPEND}"
RDEPEND="${COMMON_DEPEND}
    client? ( app-admin/influx-cli )
    telegraf? ( app-metrics/telegraf )
"

PATCHES=("${FILESDIR}/${P}-GNUmakefile.patch")

src_unpack() {
    default
    mv build ${S}/static/data || die
    cp openapi-${PN}-oss-v${PV}/contracts/oss.json ${S}/static/data/swagger.json || die
    # libflux needs cargo vendors (just as a hint)
    mv vendor go-mod/github.com/influxdata/flux@v0.171.0/libflux/ || die

    # prepare crates vendor
    mkdir -p go-mod/github.com/influxdata/flux@v0.171.0/libflux/.cargo && \
        cp ${FILESDIR}/vendor_config go-mod/github.com/influxdata/flux@v0.171.0/libflux/.cargo/config
}

src_prepare() {
    default
    sed -i -e "s/{PV}/${PV}/g" -e "s/\$(PWD)/${S//\//\\/}/g" GNUmakefile || die

    # disable manual dependency fetching
    echo -e "#!/usr/bin/env bash\necho fetching disabled by ebuild.\n" > scripts/fetch-swagger.sh || die
    echo -e "#!/usr/bin/env bash\necho fetching disabled by ebuild.\n" > scripts/fetch-ui-assets.sh || die

    # fixing pkg-config script (it's always a good idea to hide output - NOT)
    echo -e "#!/usr/bin/env bash\n${S}/bin/pkg-config \"\$@\"" > scripts/pkg-config.sh || die
}

src_compile() {
    export LDFLAGS="" # must be unset for makefile to work
    export GOBIN="${S}/bin" # path to the internal binaries go will execute

    ## building dependencies
    go build -v -ldflags="-X main.version=${PV}" -o ${S}/bin/pkg-config github.com/influxdata/pkg-config || die "couldn't build pkg-config"

    ## calling emake to use GNUmakefile compilation (generate and build)
    emake generate || die "generate deps failed"
    emake influxd || die "compile failed"
}

src_install() {
    dobin bin/linux/influx*

    # docs
    dodoc *.md
    
    #  services
    systemd_dounit ${FILESDIR}/${PN}.service

    ## TODO: add OpenRC support (can't test that currently)

    keepdir /var/log/${PN}
    fowners ${PN}:${PN} /var/log/${PN}
}

src_test() {
    go test ./tests || die
}

pkg_postinst() {
    ewarn "Make sure to initialize your data!"
    use client && ewarn "use 'influx(-cli) setup' for initial setup"
    ewarn " "
}
