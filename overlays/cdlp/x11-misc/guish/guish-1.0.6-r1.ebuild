########################################################################
# Copyright (C) 2021  Francesco Palumbo <phranz@subfc.net>, Naples (Italy)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
########################################################################

EAPI=7

inherit autotools

DESCRIPTION="A DSL and army knife to make and modify GUIs"
HOMEPAGE="https://codeberg.org/phranz/guish"
SRC_URI="https://codeberg.org/phranz/guish/archive/1.0.6-r1.tar.gz -> guish-1.0.6-r1.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
S="${WORKDIR}/guish"
IUSE="debug +embedded-control webkit +button +input +label +textblock editor +page +menu +tabpage +slider +splitter +progress +tree +trayicon +menubar +checkbox +icon +spinbox +listbox +grip"

RDEPEND="
	x11-libs/libX11
	dev-qt/qtcore:5
	dev-qt/qtwidgets:5
	dev-qt/qtgui:5
	webkit? (
		dev-qt/qtnetwork:5
		dev-qt/qtwebkit:5
	)
	embedded-control? (
		x11-libs/libXtst
	)
"

DEPEND="${RDEPEND}"

src_configure() {
	econf \
		$(use debug && echo "--enable-debug") \
		$(use embedded-control && echo "--enable-embedded-control") \
		$(use webkit && echo "--enable-webkit") \
		$(use button && echo "--enable-button") \
		$(use input && echo "--enable-input") \
		$(use label && echo "--enable-label") \
		$(use textblock && echo "--enable-textblock") \
		$(use editor && echo "--enable-editor") \
		$(use page && echo "--enable-page") \
		$(use menu && echo "--enable-menu") \
		$(use tabpage && echo "--enable-tabpage") \
		$(use slider && echo "--enable-slider") \
		$(use splitter && echo "--enable-splitter") \
		$(use progress && echo "--enable-progress") \
		$(use tree && echo "--enable-tree") \
		$(use trayicon && echo "--enable-trayicon") \
		$(use menubar && echo "--enable-menubar") \
		$(use checkbox && echo "--enable-checkbox") \
		$(use icon && echo "--enable-icon") \
		$(use spinbox && echo "--enable-spinbox") \
		$(use listbox && echo "--enable-listbox") \
		$(use grip && echo "--enable-grip") \
		|| die
}

