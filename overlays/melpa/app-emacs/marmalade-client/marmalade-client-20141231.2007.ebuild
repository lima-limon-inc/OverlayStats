# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="marmalade-client"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="client for marmalade API from emacs"

HOMEPAGE="https://github.com/nicferrier/emacs-marmalade-upload"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/web
	app-emacs/kv
	app-emacs/gh"
RDEPEND="app-emacs/web
	app-emacs/kv
	app-emacs/gh"