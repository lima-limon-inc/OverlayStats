# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="astyle"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Astyle formatter functions"

HOMEPAGE="https://github.com/storvik/emacs-astyle"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/reformatter"
RDEPEND="app-emacs/reformatter"