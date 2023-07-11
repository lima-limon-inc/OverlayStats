# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="rtags-xref"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="RTags backend for xref.el"

HOMEPAGE="https://github.com/Andersbakken/rtags"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/rtags"
RDEPEND="app-emacs/rtags"