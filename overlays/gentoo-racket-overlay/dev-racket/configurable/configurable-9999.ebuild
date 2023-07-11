# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

GH_DOM="github.com"
GH_REPO="llazarek/configurable"

inherit gh racket

DESCRIPTION="A simple software configuration system."
HOMEPAGE="https://github.com/llazarek/configurable"
S="${S}/configurable"

LICENSE="all-rights-reserved"
SLOT="0"
RESTRICT="mirror"