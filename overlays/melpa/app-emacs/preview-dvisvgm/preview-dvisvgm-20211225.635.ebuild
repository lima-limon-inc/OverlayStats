# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="preview-dvisvgm"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="SVG output for LaTeX preview"

HOMEPAGE="https://github.com/TobiasZawada/preview-dvisvgm"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/auctex"
RDEPEND="app-emacs/auctex"