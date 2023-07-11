# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="svg-mode-line-themes"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="SVG-based themes for mode-line"

HOMEPAGE="https://github.com/sabof/svg-mode-line-themes"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/xmlgen"
RDEPEND="app-emacs/xmlgen"