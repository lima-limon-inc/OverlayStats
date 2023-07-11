# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_SETUPTOOLS="rdepend"

inherit distutils-r1 optfeature pypi

DESCRIPTION="Generate block-diagram image from text"
HOMEPAGE="http://blockdiag.com/ https://pypi.org/project/blockdiag/ https://github.com/blockdiag/blockdiag/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~ia64 ppc ppc64 ~riscv ~s390 sparc x86"

RDEPEND="
	>=dev-python/funcparserlib-1.0.0_alpha0[${PYTHON_USEDEP}]
	>=dev-python/pillow-3.0.0[${PYTHON_USEDEP}]
	dev-python/webcolors[${PYTHON_USEDEP}]
"
BDEPEND=""

pkg_postinst() {
	# TODO: Better descriptions!
	optfeature "PDF format" dev-python/reportlab
	optfeature "misc extra support" media-gfx/imagemagick
	optfeature "Ctypes-based simple MagickWand API binding for Python" dev-python/wand
}
