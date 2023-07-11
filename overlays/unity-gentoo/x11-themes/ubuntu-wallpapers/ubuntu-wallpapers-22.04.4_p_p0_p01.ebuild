# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

URELEASE="jammy"
inherit ubuntu-versionator unpacker

UURL="mirror://unity/pool/main/u/${PN}"
#UVER="-${PVR_PL_MAJOR}ubuntu${PVR_PL_MINOR}.${UVER_RELEASE}.${PVR_MICRO}"

DESCRIPTION="Ubuntu wallpapers"
HOMEPAGE="https://launchpad.net/ubuntu-wallpapers"

## Main repo (URELEASE source files) ##
SRC_URI="${UURL}/${MY_P}${UVER_PREFIX}-${UVER}_all.deb
	${UURL}/${PN}-${URELEASE/-*}_${PV}${UVER_PREFIX}-${UVER}_all.deb"

## Universe repo (older source files) ##
CODE_NAME="karmic lucid maverick natty oneiric precise quantal raring
saucy trusty utopic vivid wily xenial yakkety zesty artful bionic cosmic
disco eoan focal groovy hirsute impish"

for cn in ${CODE_NAME}; do
	SRC_URI+=" ${cn}? ( ${UURL/main/universe}/${PN}-${cn}_${PV}${UVER_PREFIX}-${UVER}_all.deb )"
done

LICENSE="CC-BY-SA-3.0"
KEYWORDS="~amd64 ~x86"
SLOT="0/${URELEASE}"
IUSE="gnome ${CODE_NAME} +${URELEASE/-*}"
RESTRICT="mirror"

RDEPEND="gnome? ( x11-themes/gnome-backgrounds )"

S="${WORKDIR}"

src_unpack() {
	if [[ -n ${A} ]]; then
		for a in ${A}; do
			unpack ${a}
			unpacker ${PWD}/data.tar.zst
			rm control.tar.zst data.tar.zst debian-binary
		done
	else
		die "Source files not found"
	fi
}

src_compile() { :; }
src_test() { :; }

src_install() {
	pushd "${S}"/usr/share 1>/dev/null
		insinto /usr/share/backgrounds
		doins backgrounds/{*.jpg,*.png}

		insinto /usr/share/backgrounds/contest
		doins backgrounds/contest/*.xml

		insinto /usr/share/gnome-background-properties
		doins gnome-background-properties/*.xml

		dodoc doc/"${PN}"/copyright
	popd 1>/dev/null
}
