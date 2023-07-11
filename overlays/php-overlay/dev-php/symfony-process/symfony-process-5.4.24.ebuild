# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Executes commands in sub-processes"
HOMEPAGE="https://github.com/symfony/process"
SRC_URI="https://github.com/symfony/process/archive/v${PV}.tar.gz
	-> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

BDEPEND="dev-php/theseer-Autoload"

RDEPEND="dev-lang/php:*
	>=dev-php/symfony-polyfill-php80-1.16
	dev-php/fedora-autoloader"

S="${WORKDIR}/process-${PV}"

src_prepare() {
	default

	phpab \
		--quiet \
		--output autoload.php \
		--template fedora2 \
		--basedir . \
		. \
		|| die
}

src_install() {
	insinto '/usr/share/php/Symfony/Component/Process'
	doins -r *

	einstalldocs
}
