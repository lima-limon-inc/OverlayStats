# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://stable.melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="org-recur"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Recurring org-mode tasks"

HOMEPAGE="https://github.com/mrcnski/org-recur"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/org-mode
	app-emacs/dash"
RDEPEND="app-emacs/org-mode
	app-emacs/dash"