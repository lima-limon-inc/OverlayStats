# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="magit-p4"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="git-p4 plug-in for Magit"

HOMEPAGE="https://github.com/qoocku/magit-p4"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/magit
	app-emacs/magit-popup
	app-emacs/p4"
RDEPEND="app-emacs/magit
	app-emacs/magit-popup
	app-emacs/p4"