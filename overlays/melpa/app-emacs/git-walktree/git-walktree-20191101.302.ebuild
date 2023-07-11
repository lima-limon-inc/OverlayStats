# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="git-walktree"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Browse Git tree and blob objects"

HOMEPAGE="https://github.com/10sr/git-walktree-el"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/git"
RDEPEND="app-emacs/git"