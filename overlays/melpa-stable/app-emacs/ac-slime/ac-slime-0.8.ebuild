# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://stable.melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="ac-slime"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="An auto-complete source using slime completions"

HOMEPAGE="https://github.com/purcell/ac-slime"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/auto-complete
	app-emacs/slime"
RDEPEND="app-emacs/auto-complete
	app-emacs/slime"