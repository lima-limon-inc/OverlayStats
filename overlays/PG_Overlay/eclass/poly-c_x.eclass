# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
#
# polyc_x.eclass: eclass for all X ebuilds and their dependencies created by Polynomial-C
# eclass testes with x11-libs/pixman

inherit poly-c_ebuilds

SRC_URI="${SRC_URI/${P}/${MY_P}}"
