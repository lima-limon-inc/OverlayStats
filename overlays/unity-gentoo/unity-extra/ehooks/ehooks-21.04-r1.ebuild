# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit ubuntu-versionator

DESCRIPTION="Ebuild hooks patching system"
HOMEPAGE="https://github.com/shiznix/unity-gentoo"

URELEASE="hirsute"
UVER=

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+audacity_menu +copyq_theme +eog_menu +evince_menu +fontconfig_adjust +gnome-screenshot_adjust +gnome-terminal_theme +headerbar_adjust +libreoffice_theme +nemo_noroot +pidgin_chat +telegram_theme +totem_menu +zim_theme"

DEPEND="unity-base/unity-build-env"

RDEPEND="fontconfig_adjust? ( media-libs/freetype:2[adobe-cff,cleartype-hinting,-infinality] )
	headerbar_adjust? ( x11-misc/gtk3-nocsd )"

S=${WORKDIR}

EHOOK_UPDATE=()

src_install() {
	dosym "${REPO_ROOT}"/ehooks_check.sh /usr/bin/ehooks
}

pkg_preinst() {
	local \
		count=1 \
		sys_db="/var/db/pkg/" \
		pkg_flag sys_flag x m n slot prev_shopt

	local -a \
		ehk=() pkg=() \
		indicator=( "|" "/" "-" "\\" )

	printf "%s" "Looking for USE-flag changes ${indicator[0]}"

	for x in ${IUSE}; do
		x="${x#+}"

		## Progress indicator.
		[[ ${count} -eq 4 ]] && count=0
		printf "\b\b %s" "${indicator[${count}]}"
		count=$((count + 1))

		## Try another USE-flag if there is no change.
		use "${x}" && pkg_flag=1 || pkg_flag=0
		portageq has_version / unity-extra/ehooks["${x}"] && sys_flag=1 || sys_flag=0
		[[ ${pkg_flag} -eq ${sys_flag} ]] && continue

		## Get ebuild hooks containing recently changed USE-flag.
		prev_shopt=$(shopt -p nullglob)
		shopt -s nullglob
		ehk=( $(fgrep -l "${x}" "${REPO_ROOT}"/profiles/ehooks/*/*/*.ehook) )
		${prev_shopt}

		for m in "${ehk[@]}"; do
			## Get ${CATEGORY}/{${P}-${PR},${P},${P%.*},${P%.*.*},${PN}} from ebuild hook's path.
			m=${m%/*.ehook}
			m=${m#*/ehooks/}
			## Get ${SLOT}.
			[[ ${m} == *":"+([0-9.]) ]] && slot="${m#*:}" || slot=""
			m="${m%:*}"

			## Get installed packages affected by the ebuild hook.
			prev_shopt=$(shopt -p nullglob) ## don't use extglob
			shopt -s nullglob
			[[ -d ${sys_db}${m} ]] && pkg=( "${sys_db}${m}" ) || pkg=( "${sys_db}${m}"{-[0-9],.[0-9],-r[0-9]}*/ )
			${prev_shopt}

			for n in "${pkg[@]}"; do
				## Try another package if slots differ.
				[[ -z ${slot} ]] || fgrep -qsx "${slot}" "${n}/SLOT" || continue

				## Get =${CATEGORY}/${PF} from package's ${sys_db} path.
				n="${n%/}"
				n="${n#${sys_db}}"
				EHOOK_UPDATE+=( "=${n}" )
			done
		done
	done

	printf "\b\b%s\n" "... done!"
}

pkg_postinst() {
	echo
	if [[ -n ${EHOOK_UPDATE[@]} ]]; then
		## Remove duplicates.
		EHOOK_UPDATE=( $(printf "%s\n" "${EHOOK_UPDATE[@]}" | sort -u) )

		ewarn "Rebuild the packages affected by the USE-flag changes:"
		ewarn "emerge -1 ${EHOOK_UPDATE[@]}"
	else
		einfo "No rebuild needed"
	fi

	if [[ -d /etc/portage/ehooks/conf.d ]]; then
		echo
		echo " * Note: You can safely remove '/etc/portage/ehooks/conf.d' directory as it's not used anymore"
	fi
	echo
}
