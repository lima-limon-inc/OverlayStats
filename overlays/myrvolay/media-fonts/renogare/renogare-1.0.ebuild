# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="A modern geometric sans serif typeface (regular and soft variants)"
HOMEPAGE="https://www.creativefabrica.com/product/renogare/"

LICENSE="Renogare"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

# Cannot download them from dafont as initially attempted, since Renogare Soft does not have its .otf variant available there.
# thus we bundle the files with the package directly, which I think should be fine as it's a non-commercial use? Not a lawyer.

S="${WORKDIR}"
FONT_SUFFIX="otf"
FONT_S="${FILESDIR}"
