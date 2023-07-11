# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://stable.melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="vulpea"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="A collection of org-roam note-taking functions"

HOMEPAGE="https://github.com/d12frosted/vulpea"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/org-mode
	app-emacs/org-roam
	app-emacs/s
	app-emacs/dash"
RDEPEND="app-emacs/org-mode
	app-emacs/org-roam
	app-emacs/s
	app-emacs/dash"