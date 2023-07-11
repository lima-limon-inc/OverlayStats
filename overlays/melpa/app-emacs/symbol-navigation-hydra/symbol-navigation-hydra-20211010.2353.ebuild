# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="symbol-navigation-hydra"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="A symbol-aware, range-aware hydra"

HOMEPAGE="https://github.com/bgwines/symbol-navigation-hydra"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/auto-highlight-symbol
	app-emacs/hydra
	app-emacs/multiple-cursors"
RDEPEND="app-emacs/auto-highlight-symbol
	app-emacs/hydra
	app-emacs/multiple-cursors"