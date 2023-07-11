# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit systemd

DESCRIPTION="Meta file to pull in packages and scripts to help keep the world file clean"
HOMEPAGE="https://prototype99.github.io"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE="archive +browser +chrome +composite +composite-gui dev discord +efi +fat firefox flash +fluxbox fslint ftp +gnomekeyring-admin +index irc latex logisim mail-client +network-tray odt odt-convert openbox overlay pdf +processviewer remote-desktop screenshot spreadsheet steam +sudo terminal +terminal-fast +text-editor +text-editor-color-highlight +xfs yandex-disk"
S="${WORKDIR}"

REQUIRED_USE="
browser? ( || ( chrome firefox ) )
composite-gui? ( composite )
efi? ( fat )
text-editor-color-highlight? ( text-editor )
|| ( fluxbox openbox )
|| ( terminal-fast terminal )
"

RDEPEND="
	archive? ( app-arch/xarchiver )
	chrome? ( || ( >=www-client/chromium-78 www-client/google-chrome-beta www-client/google-chrome-unstable www-client/google-chrome ) )
	composite? ( x11-misc/compton )
	composite-gui? ( lxqt-base/compton-conf )
	dev? ( app-portage/repoman mail-mta/msmtp )
	discord? ( net-im/discord-bin )
	fat? ( sys-fs/dosfstools )
	firefox? ( || ( www-client/firefox www-client/firefox-bin ) flash? ( www-plugins/adobe-flash ) )
	fluxbox? ( x11-wm/fluxbox lxqt-base/lxqt-meta[minimal] )
	fslint? ( app-misc/fslint )
	ftp? ( net-ftp/filezilla )
	gnomekeyring-admin? ( app-crypt/seahorse )
	index? ( sys-apps/mlocate )
	irc? ( net-irc/kvirc )
	latex? ( app-office/lyx )
	logisim? ( sci-electronics/logisim-evolution-holy-cross )
	mail-client? ( mail-client/mailspring )
	network-tray? ( gnome-extra/nm-applet )
	odt? ( || ( app-office/libreoffice app-office/libreoffice-bin ) )
	odt-convert? ( dev-tex/tex4ht )
	openbox? ( lxqt-base/lxqt-meta[-minimal] )
	overlay? ( app-portage/layman )
	pdf? ( app-text/mupdf )
	processviewer? ( kde-plasma/plasma-meta[processviewer] )
	remote-desktop? ( net-misc/anydesk )
	screenshot? ( media-gfx/flameshot )
	spreadsheet? ( app-office/gnumeric )
	steam? ( games-util/steam-launcher )
	sudo? ( app-admin/sudo )
	terminal? ( lxqt-base/lxqt-meta[terminal] )
	terminal-fast? ( x11-terms/kitty )
	text-editor? (
		text-editor-color-highlight? ( app-editors/sublime-text )
		!text-editor-color-highlight? ( kde-plasma/plasma-meta[text-editor] )
		)
	xfs? ( sys-fs/xfsprogs )
	yandex-disk? ( net-misc/yandex-disk )
	virtual/linux-sources[fat?]
"

src_install() {
	use dev && newbin "${FILESDIR}"/repo-gen.sh repo-gen
	use dev && systemd_dounit "${FILESDIR}/${PN}.service"
	use dev && systemd_dounit "${FILESDIR}/${PN}.timer"
}
