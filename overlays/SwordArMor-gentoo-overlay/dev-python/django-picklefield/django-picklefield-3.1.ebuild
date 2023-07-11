# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Pickled object field for Django"
HOMEPAGE="https://github.com/gintas/django-picklefield"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-python/django[${PYTHON_USEDEP}]"

distutils_enable_tests unittest

src_prepare() {
	# Fix for >=django-3.2
	use test && (echo "DEFAULT_AUTO_FIELD = 'django.db.models.AutoField'" >> tests/settings.py || die)
	distutils-r1_src_prepare
}

python_test() {
	"${EPYTHON}" -m django test -v2 --settings=tests.settings || die "Tests fail with ${EPYTHON}"
}
