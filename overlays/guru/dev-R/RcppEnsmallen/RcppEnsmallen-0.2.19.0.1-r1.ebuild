# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit R-packages eapi8-dosym

MY_PV="$(ver_cut 2-4 ${PV})"

DESCRIPTION='Header-Only C++ Mathematical Optimization library for armadillo'
HOMEPAGE="
	https://cran.r-project.org/package=RcppEnsmallen
	https://github.com/coatless-rpkg/rcppensmallen
"
#SRC_URI="mirror://cran/src/contrib/RcppEnsmallen/RcppEnsmallen_${PV}.tar.gz"

SLOT="0/${PV}"
KEYWORDS="~amd64"
LICENSE='GPL-2+'

DEPEND="
	>=dev-lang/R-3.3.0
	dev-R/Rcpp
	=sci-libs/ensmallen-${MY_PV}*:=
"
RDEPEND="
	${DEPEND}
	>=dev-R/RcppArmadillo-0.9.800.0.0
"

SUGGESTED_PACKAGES="
	dev-R/knitr
	dev-R/rmarkdown
"

src_prepare() {
	R-packages_src_prepare

	# remove bundled
	rm -r inst/include/ensmallen_bits || die
	rm inst/include/ensmallen.hpp || die

	# link to sci-libs/ensmallen
	ln -s "${ESYSROOT}"/usr/include/ensmallen_bits inst/include/ensmallen_bits || die
	ln -s "${ESYSROOT}"/usr/include/ensmallen.hpp inst/include/ensmallen.hpp || die
}

src_install() {
	R-packages_src_install

	R_includedir="/usr/$(get_libdir)/R/site-library/${PN}/include"
	dosym8 -r /usr/include/ensmallen.hpp "${R_includedir}/ensmallen.hpp"

	# portage doesn't like symlinks to folders, symlink all the files then
	rm -rf "${ED}/${R_includedir}"/ensmallen_bits/* || die
	cp -rs "/usr/include/ensmallen_bits" "${ED}/${R_includedir}" || die
}
