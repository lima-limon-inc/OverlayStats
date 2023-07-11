# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517="setuptools"
PYTHON_COMPAT=( python3_{8..11} )

inherit git-r3 distutils-r1

MY_PN="sorted_containers"

DESCRIPTION="Python Sorted Container Types: SortedList, SortedDict, and SortedSet"
HOMEPAGE="https://github.com/grantjenks/sorted_containers"
EGIT_REPO_URI="https://github.com/grantjenks/${MY_PN}"
#/archive/v${PV}.tar.gz -> ${P}.tar.gz"
#S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="Apache-2.0"
SLOT="0"

RESTRICT="test"
