# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3

DESCRIPTION="A set of CFFI bindings to the OpenGL, GLU and GLUT APIs."
HOMEPAGE="http://common-lisp.net/project/cl-opengl/"
SRC_URI="http://common-lisp.net/~sionescu/files/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

RDEPEND="dev-lisp/cffi
		 media-libs/freeglut"

CLSYSTEMS="cl-opengl cl-glu cl-glut cl-glut-examples"

src_compile() {
	true;
}

src_install() {
	common-lisp-install-sources gl glu glut examples
	common-lisp-install-asdf
	dodoc README
}
