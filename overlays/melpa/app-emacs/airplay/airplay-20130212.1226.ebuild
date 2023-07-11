# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="airplay"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Airplay bindings to Emacs"

HOMEPAGE="https://github.com/gongo/airplay-el"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/request
	app-emacs/simple-httpd
	app-emacs/deferred"
RDEPEND="app-emacs/request
	app-emacs/simple-httpd
	app-emacs/deferred"