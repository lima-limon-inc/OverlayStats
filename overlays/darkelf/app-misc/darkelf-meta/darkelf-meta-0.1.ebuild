# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="The most relevant ebuilds from darkelf repository (meta package)"
HOMEPAGE="http://homepages.uni-paderborn.de/neuron/gentoo/darkelf/"
SRC_URI=""

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="minimal"

RDEPEND="x11-themes/darkelf-gtk-themes
		app-shells/zsh-syntax-highlighting
		app-portage/emake
		app-portage/darkelf-features
		!minimal? (
				x11-plugins/lurch
				net-dialup/simple-rt
		)
"
