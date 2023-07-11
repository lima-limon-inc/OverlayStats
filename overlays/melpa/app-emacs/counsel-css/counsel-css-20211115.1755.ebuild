# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="counsel-css"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="stylesheet-selector-aware swiper"

HOMEPAGE="https://github.com/hlissner/emacs-counsel-css"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/counsel"
RDEPEND="app-emacs/counsel"