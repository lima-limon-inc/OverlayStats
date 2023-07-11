# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="z3-mode"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="A z3/SMTLIBv2 interactive development environment"

HOMEPAGE="https://github.com/zv/z3-mode"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/flycheck"
RDEPEND="app-emacs/flycheck"