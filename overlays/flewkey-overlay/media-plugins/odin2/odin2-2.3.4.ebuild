# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

JUCE_REF="53b04877c6ebc7ef3cb42e84cb11a48e0cf809b5"
JUCELV2_REF="b8fb637be2f7d6bb3bd2f104c4c798ec79b2f2f1"
TUNING_REF="8eb7232ac24ac2f97a052063161c0c4f5fd763e3"
CLAP_JUCE_REF="f11e8c3284e7ff2629534148cbd98da9f602bfea"
CLAP_REF="84ad6fe9739d3070ed0eb05c24be303a899ab813"
CLAP_HELPERS_REF="2bb43c18788c689708ead6f127a2d75e772ab389"

SRC_URI="
	https://github.com/TheWaveWarden/odin2/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/juce-framework/JUCE/archive/${JUCE_REF}.tar.gz -> JUCE-${JUCE_REF}.tar.gz
	https://github.com/lv2-porting-project/JUCE/archive/${JUCELV2_REF}.tar.gz -> JUCE-${JUCELV2_REF}.tar.gz
	https://github.com/surge-synthesizer/tuning-library/archive/${TUNING_REF}.tar.gz -> tuning-library-${TUNING_REF}.tar.gz
	https://github.com/free-audio/clap-juce-extensions/archive/${CLAP_EXT_REF}.tar.gz -> clap-juce-extensions-${CLAP_JUCE_REF}.tar.gz
	https://github.com/free-audio/clap/archive/${CLAP_REF}.tar.gz -> clap-${CLAP_REF}.tar.gz
	https://github.com/free-audio/clap-helpers/archive/${CLAP_HELPERS_REF}.tar.gz -> clap-helpers-${CLAP_HELPERS_REF}.tar.gz
"
KEYWORDS="~amd64"

DESCRIPTION="A 24-voice polyphonic synthesizer"
HOMEPAGE="https://www.thewavewarden.com/odin2"
LICENSE="GPL-3"
SLOT="0"

DEPEND="
	media-libs/alsa-lib
	media-libs/lv2
	media-libs/mesa
	net-libs/webkit-gtk
	net-misc/curl
	x11-libs/libX11
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=( "${FILESDIR}/${P}-jucefix.patch" )

src_unpack() {
	default
	rm -rf "${S}/libs/JUCE" || die
	mv "JUCE-${JUCE_REF}" "${S}/libs/JUCE" || die
	rm -rf "${S}/libs/JUCELV2" || die
	mv "JUCE-${JUCELV2_REF}" "${S}/libs/JUCELV2" || die
	rm -rf "${S}/libs/tuning-library" || die
	mv "tuning-library-${TUNING_REF}" "${S}/libs/tuning-library" || die
	rm -rf "${S}/libs/clap-juce-extensions" || die
	mv "clap-juce-extensions-${CLAP_JUCE_REF}" "${S}/libs/clap-juce-extensions" || die
	rm -rf "${S}/libs/clap-juce-extensions/clap-libs/clap" || die
	mv "clap-${CLAP_REF}" "${S}/libs/clap-juce-extensions/clap-libs/clap" || die
	rm -rf "${S}/libs/clap-juce-extensions/clap-libs/clap-helpers" || die
	mv "clap-helpers-${CLAP_HELPERS_REF}" "${S}/libs/clap-juce-extensions/clap-libs/clap-helpers" || die
}
