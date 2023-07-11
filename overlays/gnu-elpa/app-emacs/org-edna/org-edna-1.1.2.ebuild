# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://elpa.gnu.org/packages/"
SOURCE_TYPE="tar"
REALNAME="org-edna"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Extensible Dependencies 'N' Actions"

HOMEPAGE="https://savannah.nongnu.org/projects/org-edna-el/"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/seq
	app-emacs/org-mode"
RDEPEND="app-emacs/seq
	app-emacs/org-mode"