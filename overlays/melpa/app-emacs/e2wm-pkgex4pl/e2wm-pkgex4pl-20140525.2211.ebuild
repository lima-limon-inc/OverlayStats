# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="e2wm-pkgex4pl"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Plugin of e2wm.el for package explorer of Perl"

HOMEPAGE="https://github.com/aki2o/e2wm-pkgex4pl"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/e2wm
	app-emacs/plsense-direx"
RDEPEND="app-emacs/e2wm
	app-emacs/plsense-direx"