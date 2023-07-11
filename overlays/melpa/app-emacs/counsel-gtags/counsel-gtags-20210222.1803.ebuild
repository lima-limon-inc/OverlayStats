# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="counsel-gtags"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="ivy for GNU global"

HOMEPAGE="https://github.com/FelipeLema/emacs-counsel-gtags"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/counsel
	app-emacs/seq"
RDEPEND="app-emacs/counsel
	app-emacs/seq"