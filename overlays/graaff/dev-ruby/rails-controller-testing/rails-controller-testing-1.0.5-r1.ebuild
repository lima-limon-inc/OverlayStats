# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby30 ruby31"

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Extracting assigns and assert_template from ActionDispatch"
HOMEPAGE="https://github.com/rails/rails-controller-testing"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/actionpack-5.0.1:*
	>=dev-ruby/actionview-5.0.1:*
	>=dev-ruby/activesupport-5.0.1:*
"
