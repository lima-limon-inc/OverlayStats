# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="ob-http"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="http request in org-mode babel"

HOMEPAGE="http://github.com/zweifisch/ob-http"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/s"
RDEPEND="app-emacs/s"