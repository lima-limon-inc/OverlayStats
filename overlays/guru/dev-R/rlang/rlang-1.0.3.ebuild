# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit R-packages

DESCRIPTION='Functions for Base Types and Core R and Tidyverse Features'
LICENSE='GPL-3'
HOMEPAGE="
	https://rlang.r-lib.org
	https://github.com/r-lib/rlang
	https://cran.r-project.org/package=rlang
"
KEYWORDS="~amd64"
DEPEND=">=dev-lang/R-3.4.0"
RDEPEND="${DEPEND}"

SUGGESTED_PACKAGES="
	>=dev-R/cli-3.1.0
	dev-R/covr
	dev-R/crayon
	dev-R/fs
	dev-R/glue
	dev-R/knitr
	dev-R/magrittr
	dev-R/pillar
	dev-R/rmarkdown
	>=dev-R/testthat-3.0.0
	dev-R/tibble
	dev-R/usethis
	>=dev-R/vctrs-0.2.3
	dev-R/withr
"
