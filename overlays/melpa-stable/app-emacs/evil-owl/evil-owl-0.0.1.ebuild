# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://stable.melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="evil-owl"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Preview evil registers and marks before using them"

HOMEPAGE="https://github.com/mamapanda/evil-owl"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/evil"
RDEPEND="app-emacs/evil"