# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="paradox"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="A modern Packages Menu. Colored, with package ratings, and customizable."

HOMEPAGE="https://github.com/Malabarba/paradox"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/seq
	app-emacs/let-alist
	app-emacs/spinner
	app-emacs/hydra"
RDEPEND="app-emacs/seq
	app-emacs/let-alist
	app-emacs/spinner
	app-emacs/hydra"