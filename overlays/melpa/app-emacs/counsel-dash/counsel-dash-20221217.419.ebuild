# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="counsel-dash"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Browse dash docsets using Ivy"

HOMEPAGE="https://github.com/nathankot/counsel-dash"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/dash-docs
	app-emacs/counsel"
RDEPEND="app-emacs/dash-docs
	app-emacs/counsel"