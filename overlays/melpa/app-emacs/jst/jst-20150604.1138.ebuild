# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="jst"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="JS test mode"

HOMEPAGE="https://github.com/cheunghy/jst-mode"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/s
	app-emacs/f
	app-emacs/dash
	app-emacs/pcache"
RDEPEND="app-emacs/s
	app-emacs/f
	app-emacs/dash
	app-emacs/pcache"