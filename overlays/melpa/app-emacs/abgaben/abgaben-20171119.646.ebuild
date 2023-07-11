# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="abgaben"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="review and correct assignments received by mail"

HOMEPAGE="http://arne.chark.eu/"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/pdf-tools
	app-emacs/f
	app-emacs/s"
RDEPEND="app-emacs/pdf-tools
	app-emacs/f
	app-emacs/s"