# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://stable.melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="company-jedi"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="company-mode completion back-end for Python JEDI"

HOMEPAGE="https://stable.melpa.org/packages/"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/company
	app-emacs/jedi-core"
RDEPEND="app-emacs/company
	app-emacs/jedi-core"