# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=BINGOS
MODULE_VERSION=0.36
inherit perl-module

DESCRIPTION="A generic input parsing/checking mechanism"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="virtual/perl-Locale-Maketext-Simple"
DEPEND="${RDEPEND}"

SRC_TEST=do
