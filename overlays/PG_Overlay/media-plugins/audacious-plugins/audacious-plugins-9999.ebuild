# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PLOCALES="ar be bg ca cmn cs da de el en_GB es es_AR es_MX et fi fr gl hu id_ID it ja ko lt lv ml_IN ms nl pl pt_BR pt_PT ru si sk sl sq sr sr_RS sv ta tr uk zh_CN zh_TW"

MY_P="${P/_/-}"

if [[ ${PV} == *9999 ]]; then
	inherit autotools git-r3 plocale
	EGIT_REPO_URI="https://github.com/audacious-media-player/audacious-plugins.git"
else
	SRC_URI="https://distfiles.audacious-media-player.org/${MY_P}.tar.bz2"
	KEYWORDS="~amd64 ~x86"
fi
DESCRIPTION="Lightweight and versatile audio player"
HOMEPAGE="https://audacious-media-player.org/"

LICENSE="GPL-2"
SLOT="0"
IUSE="aac +alsa ampache bs2b cdda cue ffmpeg flac fluidsynth gme http jack
	lame libnotify libsamplerate lirc mms modplug mp3 nls opengl pulseaudio
	scrobbler sdl sid sndfile soxr speedpitch streamtuner vorbis wavpack"
REQUIRED_USE="ampache? ( http ) streamtuner? ( http )"

# The following plugins REQUIRE a GUI build of audacious, because non-GUI
# builds do NOT install the libaudgui library & headers.
# Plugins without a configure option:
#   alarm
#   albumart
#   delete-files
#   ladspa
#   playlist-manager
#   search-tool
#   skins
#   vtx
# Plugins with a configure option:
#   glspectrum
#   gtkui
#   hotkey
#   notify
#   statusicon
BDEPEND="
	dev-util/gdbus-codegen
	virtual/pkgconfig
	nls? ( dev-util/intltool )
"
DEPEND="
	app-arch/unzip
	dev-libs/dbus-glib
	dev-libs/glib
	dev-libs/libxml2:2
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtmultimedia:5
	dev-qt/qtwidgets:5
	~media-sound/audacious-${PV}
	aac? ( >=media-libs/faad2-2.7 )
	alsa? ( >=media-libs/alsa-lib-1.0.16 )
	ampache? ( =media-libs/ampache_browser-1* )
	bs2b? ( media-libs/libbs2b )
	cdda? (
		dev-libs/libcdio:=
		dev-libs/libcdio-paranoia:=
		>=media-libs/libcddb-1.2.1
	)
	cue? ( media-libs/libcue:= )
	ffmpeg? ( >=media-video/ffmpeg-0.7.3 )
	flac? (
		>=media-libs/flac-1.2.1-r1
		>=media-libs/libvorbis-1.0
	)
	fluidsynth? ( media-sound/fluidsynth:= )
	http? ( >=net-libs/neon-0.26.4 )
	jack? (
		>=media-libs/bio2jack-0.4
		virtual/jack
	)
	lame? ( media-sound/lame )
	libnotify? ( x11-libs/libnotify )
	libsamplerate? ( media-libs/libsamplerate:= )
	lirc? ( app-misc/lirc )
	mms? ( >=media-libs/libmms-0.3 )
	modplug? ( media-libs/libmodplug )
	mp3? ( >=media-sound/mpg123-1.12.1 )
	opengl? ( dev-qt/qtopengl:5 )
	pulseaudio? ( >=media-sound/pulseaudio-0.9.3 )
	scrobbler? ( net-misc/curl )
	sdl? ( media-libs/libsdl2[sound] )
	sid? ( >=media-libs/libsidplayfp-1.0.0 )
	sndfile? ( >=media-libs/libsndfile-1.0.17-r1 )
	soxr? ( media-libs/soxr )
	speedpitch? ( media-libs/libsamplerate:= )
	streamtuner? ( dev-qt/qtnetwork:5 )
	vorbis? (
		>=media-libs/libogg-1.1.3
		>=media-libs/libvorbis-1.2.0
	)
	wavpack? ( >=media-sound/wavpack-4.50.1-r1 )
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

pkg_setup() {
	use mp3 || ewarn "MP3 support is optional, you may want to enable the mp3 USE-flag"
}

src_prepare() {
	default
	if ! use nls; then
		sed -e "/SUBDIRS/s/ po//" -i Makefile || die # bug #512698
	fi

	rm_loc() {
		rm -vf "po/${1}.po" || die
		sed -i s/${1}.po// po/Makefile || die
	}
	plocale_find_changes po "" ".po"
	plocale_for_each_disabled_locale rm_loc

	[[ ${PV} == *9999 ]] && eautoreconf
}

src_configure() {
	local myeconfargs=(
		--enable-mpris2
		--enable-qt
		--enable-qtaudio
		--enable-songchange
		--disable-adplug # not packaged
		--disable-gtk
		--disable-openmpt # not packaged
		--disable-oss4
		--disable-coreaudio
		--disable-sndio
		$(use_enable aac)
		$(use_enable alsa)
		$(use_enable ampache)
		$(use_enable bs2b)
		$(use_enable cdda cdaudio)
		$(use_enable cue)
		$(use_enable flac)
		$(use_enable flac filewriter)
		$(use_enable fluidsynth amidiplug)
		$(use_enable gme console)
		$(use_enable http neon)
		$(use_enable jack)
		$(use_enable lame filewriter_mp3)
		$(use_enable libnotify notify)
		$(use_enable libsamplerate resample)
		$(use_enable lirc)
		$(use_enable mms)
		$(use_enable modplug)
		$(use_enable mp3 mpg123)
		$(use_enable nls)
		$(use_enable opengl qtglspectrum)
		$(use_enable pulseaudio pulse)
		$(use_enable scrobbler scrobbler2)
		$(use_enable sdl sdlout)
		$(use_enable sid)
		$(use_enable sndfile)
		$(use_enable soxr)
		$(use_enable speedpitch)
		$(use_enable streamtuner)
		$(use_enable vorbis)
		$(use_enable wavpack)
		$(use_with ffmpeg ffmpeg ffmpeg)
	)

	econf "${myeconfargs[@]}"

	sed -i 's/asx //' extra.mk || die
	sed -i 's/asx3 //' extra.mk || die
	sed -i 's/pls //' extra.mk || die
	sed -i 's/xspf //' extra.mk || die
	sed -i '/EFFECT_PLUGIN/d' extra.mk || die
	#sed -i 's/playlist-manager-qt //' extra.mk || die
	#sed -i 's/search-tool-qt //' extra.mk || die
	sed -i 's/skins-qt //' extra.mk || die
	sed -i 's/delete-files //' extra.mk || die
	sed -i 's/skins-data //' extra.mk || die
	sed -i 's/adplug //' extra.mk || die
	sed -i 's/metronom //' extra.mk || die
	sed -i 's/psf //' extra.mk || die
	sed -i 's/tonegen //' extra.mk || die
	sed -i 's/vtx //' extra.mk || die
	sed -i 's/xsf //' extra.mk || die
	sed -i 's/ filewriter//' extra.mk || die
	sed -i 's/ gio//' extra.mk || die
	sed -i '/VISUALIZATION_PLUGIN/d' extra.mk || die
}
