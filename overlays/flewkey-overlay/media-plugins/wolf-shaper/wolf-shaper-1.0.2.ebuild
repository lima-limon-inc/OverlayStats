# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/pdesaulniers/wolf-shaper.git"
else
	DPF_REF="d8c26737120cc36aacfb61c7c6b667eb6814e392"
	PUGL_REF="844528e197c51603f6cef3238b4a48d23bf60eb7"
	SRC_URI="
		https://github.com/wolf-plugins/wolf-shaper/archive/v${PV}.tar.gz  -> ${P}.tar.gz
		https://github.com/DISTRHO/DPF/archive/${DPF_REF}.tar.gz -> dpf-${DPF_REF}.tar.gz
		https://github.com/DISTRHO/pugl/archive/${PUGL_REF}.tar.gz -> pugl-${PUGL_REF}.tar.gz
	"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Waveshaper plugin w/ spline-based graph editor"
HOMEPAGE="https://pdesaulniers.github.io/wolf-shaper/"
LICENSE="GPL-3"
SLOT="0"
IUSE="+lv2 +clap +vst3 vst2 dssi jack"

DEPEND="jack? ( virtual/jack )"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	if [[ ${PV} == 9999 ]]; then
		git-r3_src_unpack
	else
		default
		rm -rf "${S}/dpf" || die
		cp -r "${WORKDIR}/DPF-${DPF_REF}" "${S}/dpf" || die
		rm -rf "${S}/dpf/dgl/src/pugl-upstream" || die
		ln -s "${WORKDIR}/pugl-${PUGL_REF}" "${S}/dpf/dgl/src/pugl-upstream" || die
	fi
}

src_compile() {
	export BUILD_LV2=$(usex lv2 true false)
	export BUILD_CLAP=$(usex clap true false)
	export BUILD_VST3=$(usex vst3 true false)
	export BUILD_VST2=$(usex vst2 true false)
	export BUILD_DSSI=$(usex dssi true false)
	export BUILD_JACK=$(usex jack true false)
	export SKIP_STRIPPING=true
	default
}

src_install() {
	if use lv2; then
		dodir /usr/$(get_libdir)/lv2
		cp -r "${S}/bin/${PN}.lv2" "${D}/usr/$(get_libdir)/lv2" || die
	fi
	if use clap; then
		dodir /usr/$(get_libdir)/clap
		cp -r "${S}/bin/${PN}.clap" "${D}/usr/$(get_libdir)/clap" || die
	fi
	if use vst3; then
		dodir /usr/$(get_libdir)/vst3
		cp -r "${S}/bin/${PN}.vst3" "${D}/usr/$(get_libdir)/vst3" || die
	fi
	if use vst2; then
		dodir /usr/$(get_libdir)/vst
		cp "${S}/bin/${PN}-vst.so" "${D}/usr/$(get_libdir)/vst" || die
	fi
	if use dssi; then
		dodir /usr/$(get_libdir)/dssi
		cp "${S}/bin/${PN}-dssi.so" "${D}/usr/$(get_libdir)/dssi" || die
		cp -r "${S}/bin/${PN}-dssi" "${D}/usr/$(get_libdir)/dssi" || die
	fi
	if use jack; then
		dodir /usr/bin
		dobin "${S}/bin/${PN}"
	fi
}
