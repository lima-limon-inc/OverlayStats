# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="helm-lean"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Helm interfaces for lean-mode"

HOMEPAGE="https://github.com/leanprover/lean-mode"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/dash
	app-emacs/helm
	app-emacs/lean-mode"
RDEPEND="app-emacs/dash
	app-emacs/helm
	app-emacs/lean-mode"