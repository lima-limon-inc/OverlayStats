# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://stable.melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="lsp-origami"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="origami.el support for lsp-mode"

HOMEPAGE="https://github.com/emacs-lsp/lsp-origami"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/origami
	app-emacs/lsp-mode"
RDEPEND="app-emacs/origami
	app-emacs/lsp-mode"