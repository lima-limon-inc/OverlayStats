# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="evil-opener"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="opening urls as buffers in evil"

HOMEPAGE="https://github.com/0robustus1/opener.el"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/evil
	app-emacs/opener"
RDEPEND="app-emacs/evil
	app-emacs/opener"