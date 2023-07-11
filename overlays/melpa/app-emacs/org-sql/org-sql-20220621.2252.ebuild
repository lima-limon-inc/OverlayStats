# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="org-sql"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Org-Mode SQL converter"

HOMEPAGE="https://github.com/ndwarshuis/org-sql"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/s
	app-emacs/f
	app-emacs/dash
	app-emacs/org-ml"
RDEPEND="app-emacs/s
	app-emacs/f
	app-emacs/dash
	app-emacs/org-ml"