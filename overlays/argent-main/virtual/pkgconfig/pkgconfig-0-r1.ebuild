# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib-build

DESCRIPTION="Virtual for the pkg-config implementation"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	|| (
		>=dev-util/pkgconfig-0.28-r1[${MULTILIB_USEDEP}]
		>=dev-util/pkgconf-0.9.3-r1[pkg-config,${MULTILIB_USEDEP}]
		>=dev-util/pkgconfig-openbsd-20130507-r1[pkg-config,${MULTILIB_USEDEP}]
	)"
