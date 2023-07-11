# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://stable.melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="mocha-snippets"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Yasnippets for the Mocha JS Testing Framework"

HOMEPAGE="https://stable.melpa.org/packages/"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/yasnippet"
RDEPEND="app-emacs/yasnippet"