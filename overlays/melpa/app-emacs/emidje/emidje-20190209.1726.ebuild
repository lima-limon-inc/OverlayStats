# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="emidje"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Test runner and report viewer for Midje"

HOMEPAGE="https://github.com/nubank/emidje"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/cider
	app-emacs/seq
	app-emacs/magit-popup"
RDEPEND="app-emacs/cider
	app-emacs/seq
	app-emacs/magit-popup"