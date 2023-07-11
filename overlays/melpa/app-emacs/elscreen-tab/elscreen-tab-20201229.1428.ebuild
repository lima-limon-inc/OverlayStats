# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="elscreen-tab"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="minor mode to display tabs of elscreen in a dedicated buffer"

HOMEPAGE="https://github.com/aki-s/elscreen-tab"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/elscreen
	app-emacs/dash"
RDEPEND="app-emacs/elscreen
	app-emacs/dash"