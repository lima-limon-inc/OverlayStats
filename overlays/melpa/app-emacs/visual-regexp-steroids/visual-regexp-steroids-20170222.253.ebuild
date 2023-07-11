# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="visual-regexp-steroids"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Extends visual-regexp to support other regexp engines"

HOMEPAGE="https://github.com/benma/visual-regexp-steroids.el/"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/visual-regexp"
RDEPEND="app-emacs/visual-regexp"