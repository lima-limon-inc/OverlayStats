# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="helm-lines"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="A helm interface for completing by lines"

HOMEPAGE="https://github.com/torgeir/helm-lines.el/"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/helm"
RDEPEND="app-emacs/helm"