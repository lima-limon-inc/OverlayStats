# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

JUCE_VERSION="6.0.8"

inherit projucer

JUCE_REF="2cd8198486059e5547f7bd9d6b432be7df8d455b"
TUNING_REF="8eb7232ac24ac2f97a052063161c0c4f5fd763e3"

SRC_URI="
	https://github.com/TheWaveWarden/odin2/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/surge-synthesizer/tuning-library/archive/${TUNING_REF}.tar.gz -> tuning-library-${TUNING_REF}.tar.gz
	https://github.com/lv2-porting-project/JUCE/archive/${JUCE_REF}.tar.gz -> JUCE-${JUCE_REF}.tar.gz
"
KEYWORDS="~amd64"

DESCRIPTION="A 24-voice polyphonic synthesizer"
HOMEPAGE="https://www.thewavewarden.com/odin2"
LICENSE="GPL-3"
SLOT="0"
IUSE="+lv2"

DEPEND="
	media-libs/alsa-lib
	media-libs/lv2
	media-libs/mesa
	net-libs/webkit-gtk
	net-misc/curl
	x11-libs/libX11
"
RDEPEND="${DEPEND}"
BDEPEND="|| ( ~dev-libs/juce-6.0.8[projucer] ~dev-libs/juce-6.0.8[extras] )"

src_unpack() {
	default
	rm -rf "${S}/tuning-library" || die
	mv "tuning-library-${TUNING_REF}" "${S}/tuning-library" || die
}

src_prepare() {
	if use lv2 ; then
		JUCE_MODULES_PATH="${WORKDIR}/JUCE-${JUCE_REF}/modules"
		projucer_resave Odin.jucer
		# LV2 configuration commands copypasta'd from the Odin 2 repo
		export LINE_NUMBER="$(grep -n 'BEGIN_USER_CODE_SECTION' JuceLibraryCode/AppConfig.h | cut -d: -f1)"
		head -n $LINE_NUMBER JuceLibraryCode/AppConfig.h > app_config.tmp
		echo -e "#define JucePlugin_Build_LV2 1" >> app_config.tmp
		echo -e "#define JucePlugin_LV2URI \"https://www.thewavewarden.com/odin2\"" >> app_config.tmp
		echo -e "#define JucePlugin_MaxNumOutputChannels 2" >> app_config.tmp
		tail -n +$((LINE_NUMBER+1)) JuceLibraryCode/AppConfig.h >> app_config.tmp
		mv app_config.tmp JuceLibraryCode/AppConfig.h
		echo -e "include ../../LV2.mak" >> "${S}/Builds/LinuxMakefile/Makefile"
	fi
	S="${S}/Builds/LinuxMakefile"
	default
}

src_install() {
	dodir /usr/$(get_libdir)/vst3
	cp -r "${S}/build/Odin2.vst3" "${D}/usr/$(get_libdir)/vst3"
	dodir /opt/odin2
	cp -r "${WORKDIR}/${P}/Soundbanks" "${D}/opt/odin2"
	if use lv2 ; then
		dodir /usr/$(get_libdir)/lv2
		cp -r "${S}/build/Odin2_.lv2" "${D}/usr/$(get_libdir)/lv2"
	fi
}
