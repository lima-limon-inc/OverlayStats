# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="eyuml"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Write textual uml diagram from emacs using yuml.me"

HOMEPAGE="http://github.com/antham/eyuml"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/request
	app-emacs/s"
RDEPEND="app-emacs/request
	app-emacs/s"