# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="vegetative-theme"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="A Theme based on green CRT terminals"

HOMEPAGE="http://github.com/emacsfodder/emacs-theme-vegetative"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/autothemer"
RDEPEND="app-emacs/autothemer"