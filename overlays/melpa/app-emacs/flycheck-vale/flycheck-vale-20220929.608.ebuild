# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="flycheck-vale"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="flycheck integration for vale"

HOMEPAGE="https://github.com/abingham/flycheck-vale"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/flycheck
	app-emacs/let-alist"
RDEPEND="app-emacs/flycheck
	app-emacs/let-alist"