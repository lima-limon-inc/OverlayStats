# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{5..11} )

inherit distutils-r1

GLM_COMMIT="fcda03b54596adda543bcdccc6c1879e380c86a7"
TYPING_COMMIT="f47636b86d07d4f91692235e8dfe0af1bd22e883"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Zuzu-Typ/PyGLM.git"
	EGIT_SUBMODULES=( glm pyglm-typing )
else
	SRC_URI="
		https://github.com/Zuzu-Typ/PyGLM/archive/${PV}.tar.gz -> ${P}.gh.tar.gz
		https://github.com/g-truc/glm/archive/${GLM_COMMIT}.tar.gz -> glm-${GLM_COMMIT}.gh.tar.gz
		https://github.com/esoma/pyglm-typing/archive/${TYPING_COMMIT}.tar.gz -> pyglm-typing-${TYPING_COMMIT}.gh.tar.gz
	"
	KEYWORDS="~amd64"
	MY_PN="PyGLM"
	MY_P="${MY_PN}-${PV}"
	S="${WORKDIR}/${MY_P}"
fi

DESCRIPTION="Fast OpenGL Mathematics"
HOMEPAGE="https://github.com/Zuzu-Typ/PyGLM"
LICENSE="ZLIB"
SLOT="0"

RDEPEND=""
BDEPEND="media-libs/glm"

src_unpack() {
	if [[ ${PV} == 9999 ]]; then
		git-r3_src_unpack
	else
		default
		rm -rf "${S}/glm" || die
		mv "${WORKDIR}/glm-${GLM_COMMIT}" "${S}/glm" || die
		rm -rf "${S}/pyglm-typing" || die
		mv "${WORKDIR}/pyglm-typing-${TYPING_COMMIT}" "${S}/pyglm-typing" || die
	fi
}
