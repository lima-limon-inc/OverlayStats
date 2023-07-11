# Copyright 2019-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGO_PN="github.com/justmiles/${PN}"

inherit go-module

if [[ ${PV} == *9999* ]]; then
    inherit git-r3
    EGIT_REPO_URI="https://${EGO_PN}.git"
    EGO_VER="devel"

    src_unpack() {
        git-r3_src_unpack
        #go-module_live_vendor
    }
else
    EGO_VER="v${PV}"
    SRC_URI="https://${EGO_PN}/archive/${EGO_VER}.tar.gz -> ${P}.tar.gz"
    #inherit git-r3
    #EGIT_REPO_URI="https://${EGO_PN}.git"
    #EGIT_COMMIT="${EGO_VER}"

    #src_unpack() {
    #    git-r3_src_unpack
    #    go-module_live_vendor
    #}

    #S="${WORKDIR}/cli-${P}"
    KEYWORDS="~amd64 ~x86 ~arm64 ~arm"
fi

DESCRIPTION="Run SQL statements against Amazon Athena and return results to stdout"
LICENSE="GPL-3"
SLOT="0/${PVR}"
RESTRICT="mirror"
IUSE="+pie"

if [[ ${PV} != *9999* ]]; then
PATCHES=(
    "${FILESDIR}/00-feature-workgroup.patch"
)
fi

src_compile() {
    # -buildmode=pie forces external linking mode, even CGO_ENABLED=0
    # https://github.com/golang/go/issues/18968
    use pie && local build_pie="-buildmode=pie"

    local build_flags="$( echo ${EGO_BUILD_FLAGS} ) $( echo ${build_pie} )"
    local ld_flags="$( echo "" )"

    set -- env \
        CGO_ENABLED=0 \
        go build -o "bin/${PN}" -mod=vendor -v -work -x ${build_flags} -ldflags "${ld_flags}" \
            .
    echo "$@"
    "$@" || die
}

src_install() {
    dobin bin/*
}
