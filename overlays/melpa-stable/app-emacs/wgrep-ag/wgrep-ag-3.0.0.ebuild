# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://stable.melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="wgrep-ag"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Writable ag buffer"

HOMEPAGE="http://github.com/mhayashi1120/Emacs-wgrep/raw/master/wgrep-ag.el"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/wgrep"
RDEPEND="app-emacs/wgrep"