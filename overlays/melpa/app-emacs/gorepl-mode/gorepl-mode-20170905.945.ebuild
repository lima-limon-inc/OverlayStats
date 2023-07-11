# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="gorepl-mode"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Go REPL Interactive Development in top of Gore"

HOMEPAGE="http://www.github.com/manute/gorepl-mode"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/s
	app-emacs/f
	app-emacs/hydra"
RDEPEND="app-emacs/s
	app-emacs/f
	app-emacs/hydra"