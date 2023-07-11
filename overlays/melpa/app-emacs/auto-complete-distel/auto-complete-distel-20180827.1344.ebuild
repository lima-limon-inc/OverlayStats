# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="auto-complete-distel"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Erlang/distel completion backend for auto-complete-mode"

HOMEPAGE="github.com/sebastiw/distel-completion"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/auto-complete
	app-emacs/distel-completion-lib"
RDEPEND="app-emacs/auto-complete
	app-emacs/distel-completion-lib"