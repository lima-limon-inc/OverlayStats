# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="jump"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="build functions which contextually jump between files"

HOMEPAGE="http://github.com/eschulte/jump.el"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/findr
	app-emacs/inflections"
RDEPEND="app-emacs/findr
	app-emacs/inflections"