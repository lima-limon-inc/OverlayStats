# Copyright 2019-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PHP_EXT_NAME="inotify"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
PHP_EXT_PECL_FILENAME="inotify-${PV}.tgz"

USE_PHP="php7-4 php8-0 php8-1"

inherit php-ext-pecl-r3

KEYWORDS="~amd64"

DESCRIPTION="Inotify binding for PHP"
HOMEPAGE="https://pecl.php.net/package/inotify"
LICENSE="PHP-3"
SLOT="0/3"
