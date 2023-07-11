# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="org-pdftools"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Support for links to documents in pdfview mode"

HOMEPAGE="https://github.com/fuxialexander/org-pdftools"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/org-mode
	app-emacs/pdf-tools
	app-emacs/org-noter"
RDEPEND="app-emacs/org-mode
	app-emacs/pdf-tools
	app-emacs/org-noter"