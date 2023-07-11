# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="micromamba"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="A library for working with micromamba environments"

HOMEPAGE="https://github.com/SqrtMinusOne/micromamba.el"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/pythonic"
RDEPEND="app-emacs/pythonic"