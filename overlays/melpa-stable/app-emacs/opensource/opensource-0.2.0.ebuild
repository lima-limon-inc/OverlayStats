# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://stable.melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="opensource"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Client for Opensource API"

HOMEPAGE="https://github.com/nlamirault/opensource.el"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/s
	app-emacs/dash
	app-emacs/pkg-info
	app-emacs/request"
RDEPEND="app-emacs/s
	app-emacs/dash
	app-emacs/pkg-info
	app-emacs/request"