# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/michaelwillis/dragonfly-reverb.git"
	EGIT_SUBMODULES=( dpf dpf/dgl/src/pugl-upstream )
else
	DPF_REF="22413340a6d8ef2ffbf38ce841fb44c448a1a84a"
	PUGL_REF="3e03459a5a0b0f118b04e9e0b0a32f42ccd04a5c"
	SRC_URI="
		https://github.com/michaelwillis/dragonfly-reverb/archive/${PV}.tar.gz -> ${P}.gh.tar.gz
		https://github.com/DISTRHO/DPF/archive/${DPF_REF}.tar.gz -> dpf-${DPF_REF}.gh.tar.gz
		https://github.com/DISTRHO/pugl/archive/${PUGL_REF}.tar.gz -> pugl-${PUGL_REF}.gh.tar.gz
	"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A set of free reverb effects"
HOMEPAGE="https://michaelwillis.github.io/dragonfly-reverb/"
LICENSE="GPL-3"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/jack
	x11-libs/libX11
"

src_unpack() {
	if [[ ${PV} == 9999 ]]; then
		git-r3_src_unpack
	else
		default
		rm -rf "${S}/dpf" || die
		ln -s "${WORKDIR}/DPF-${DPF_REF}" "${S}/dpf" || die
		rm -rf "${S}/dpf/dgl/src/pugl-upstream" || die
		ln -s "${WORKDIR}/pugl-${PUGL_REF}" "${S}/dpf/dgl/src/pugl-upstream" || die
	fi
}

src_compile() {
	export SKIP_STRIPPING=true
	default_src_compile
}

src_install() {
	dobin bin/DragonflyEarlyReflections
	dobin bin/DragonflyPlateReverb
	dobin bin/DragonflyHallReverb
	dobin bin/DragonflyRoomReverb
	dodir /usr/$(get_libdir)/vst
	cp "${S}/bin/DragonflyEarlyReflections-vst.so" "${D}/usr/$(get_libdir)/vst"
	cp "${S}/bin/DragonflyPlateReverb-vst.so" "${D}/usr/$(get_libdir)/vst"
	cp "${S}/bin/DragonflyHallReverb-vst.so" "${D}/usr/$(get_libdir)/vst"
	cp "${S}/bin/DragonflyRoomReverb-vst.so" "${D}/usr/$(get_libdir)/vst"
	dodir /usr/$(get_libdir)/vst3
	cp -r "${S}/bin/DragonflyEarlyReflections.vst3" "${D}/usr/$(get_libdir)/vst3"
	cp -r "${S}/bin/DragonflyPlateReverb.vst3" "${D}/usr/$(get_libdir)/vst3"
	cp -r "${S}/bin/DragonflyHallReverb.vst3" "${D}/usr/$(get_libdir)/vst3"
	cp -r "${S}/bin/DragonflyRoomReverb.vst3" "${D}/usr/$(get_libdir)/vst3"
	dodir /usr/$(get_libdir)/lv2
	cp -r "${S}/bin/DragonflyEarlyReflections.lv2" "${D}/usr/$(get_libdir)/lv2"
	cp -r "${S}/bin/DragonflyPlateReverb.lv2" "${D}/usr/$(get_libdir)/lv2"
	cp -r "${S}/bin/DragonflyHallReverb.lv2" "${D}/usr/$(get_libdir)/lv2"
	cp -r "${S}/bin/DragonflyRoomReverb.lv2" "${D}/usr/$(get_libdir)/lv2"
	dodir /usr/$(get_libdir)/clap
	cp -r "${S}/bin/DragonflyEarlyReflections.clap" "${D}/usr/$(get_libdir)/clap"
	cp -r "${S}/bin/DragonflyPlateReverb.clap" "${D}/usr/$(get_libdir)/clap"
	cp -r "${S}/bin/DragonflyHallReverb.clap" "${D}/usr/$(get_libdir)/clap"
	cp -r "${S}/bin/DragonflyRoomReverb.clap" "${D}/usr/$(get_libdir)/clap"
}
