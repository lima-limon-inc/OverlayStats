# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="lsp-p4"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="P4 support for lsp-mode"

HOMEPAGE="https://github.com/dmakarov/p4ls"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/lsp-mode"
RDEPEND="app-emacs/lsp-mode"