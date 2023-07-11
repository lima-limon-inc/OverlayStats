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

DESCRIPTION="A simple text to brainfuck code converter"
HOMEPAGE="https://codeberg.org/phranz/bftxt"
SRC_URI="https://codeberg.org/phranz/bftxt/archive/0.1.1-r3.tar.gz -> bftxt-0.1.1-r3.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
S="${WORKDIR}/bftxt"

src_install() {
	dodoc COPYING README
	dobin bftxt
}
