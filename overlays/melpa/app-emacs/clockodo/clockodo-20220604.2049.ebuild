# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="clockodo"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="A small integration for the clockodo api"

HOMEPAGE="https://github.com/santifa/clockodo-el"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/request
	app-emacs/ts
	app-emacs/org-mode"
RDEPEND="app-emacs/request
	app-emacs/ts
	app-emacs/org-mode"