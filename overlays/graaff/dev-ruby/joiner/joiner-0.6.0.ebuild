# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby27 ruby30 ruby31"

RUBY_FAKEGEM_RECIPE_DOC="none"
RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Builds ActiveRecord joins from association paths"
HOMEPAGE="https://pat.github.io/thinking-sphinx"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1-2)"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-6.1.0:*"

# There are specs in the package but they require that MySQL support
# has been set up for it, so we can't run them out of the box.
