# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="ix"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Emacs client for http://ix.io pastebin"

HOMEPAGE="http://www.github.com/theanalyst/ix.el"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/grapnel"
RDEPEND="app-emacs/grapnel"