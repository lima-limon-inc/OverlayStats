#!/bin/sh
check_version()
{
	PKG=$1
	URL=$2
	# Check version
	NAME=$(echo "$PKG" | cut -d "/" -f2)
	VER=$(ls "$PKG" -1v | grep ".ebuild")
	VER=$(echo "$VER" | grep -v "9999.ebuild" | tail -1)
	VER=${VER#$NAME-}
	VER=${VER%.ebuild}
	# Check tags
	if test "$(echo "$URL" | cut -d "/" -f3)" == "github.com"; then
		# GitHub's API, since they don't support dumb HTTP
		URL=https://api.github.com/repos${URL#https://github.com}
		URL=${URL%.git}
		TAG=$(wget --quiet "$URL"/tags -O - | head -3 | tail -1)
		TAG=${TAG#    \"name\": \"}
		TAG=${TAG%\",}
	else
		# Git host with dumb HTTP support
		TAG=$(wget --quiet "$URL"/info/refs -O - | tail -1)
		TAG=$(echo "$TAG" | cut -d "/" -f3 | cut -d "^" -f1)
	fi
	# Remove version letter
	if not expr "$TAG" : "[0-9]" > /dev/null; then
		TAG=${TAG#?}
	fi
	# Notify user
	if test "$VER" != "$TAG"; then
		echo "$PKG: Update from $VER to $TAG"
	fi
}

echo "This script gets the latest version by checking for the first ref given"
echo "It's simple, but it isn't very accurate, so expect many false positives"
check_version dev-libs/libcyaml https://github.com/tlsa/libcyaml.git
check_version dev-libs/reproc https://github.com/DaanDeMeyer/reproc.git
check_version games-util/multimc5 https://github.com/MultiMC/MultiMC5.git
check_version media-libs/libaudec https://git.zrythm.org/git/libaudec
#check_version media-plugins/bitrot (No tags)
#check_version media-plugins/bolliedelayxt-lv2 (No tags)
check_version media-plugins/bslizr https://github.com/sjaehn/BSlizr.git
check_version media-plugins/dragonfly-reverb https://github.com/michaelwillis/dragonfly-reverb.git
#check_version media-plugins/eq10q (SourceForge not supported)
check_version media-plugins/geonkick https://github.com/iurie-sw/geonkick.git
#check_version media-plugins/obs-wlrobs (No tags)
check_version media-plugins/remid https://github.com/ssj71/reMID.lv2.git
check_version media-plugins/surge https://github.com/surge-synthesizer/surge.git
check_version media-plugins/tap-plugins https://github.com/tomszilagyi/tap-plugins.git
check_version media-plugins/wolf-shaper https://github.com/pdesaulniers/wolf-shaper.git
check_version media-plugins/x42-autotune https://github.com/x42/fat1.lv2.git
check_version media-plugins/x42-avldrums https://github.com/x42/avldrums.lv2.git
check_version media-plugins/x42-midifilter https://github.com/x42/midifilter.lv2.git
check_version media-plugins/x42-tuner https://github.com/x42/tuna.lv2.git
check_version media-plugins/zam-plugins https://github.com/zamaudio/zam-plugins.git
check_version media-sound/klystrack https://github.com/kometbomb/klystrack.git
check_version media-sound/zrythm https://git.zrythm.org/git/zrythm
check_version media-video/olive https://github.com/olive-editor/olive.git
check_version net-im/lightcord-bin https://github.com/Lightcord/Lightcord.git
check_version x11-libs/redkite https://github.com/iurie-sw/redkite.git
