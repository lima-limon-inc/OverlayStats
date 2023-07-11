# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="erk"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Elisp (GitHub) Repository Kit"

HOMEPAGE="http://github.com/positron-solutions/elisp-repo-kit"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/auto-compile
	app-emacs/dash"
RDEPEND="app-emacs/auto-compile
	app-emacs/dash"