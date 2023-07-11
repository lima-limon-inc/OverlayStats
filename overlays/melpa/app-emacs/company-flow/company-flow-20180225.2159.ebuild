# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="company-flow"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Flow backend for company-mode"

HOMEPAGE="https://github.com/aaronjensen/company-flow"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/company
	app-emacs/dash"
RDEPEND="app-emacs/company
	app-emacs/dash"