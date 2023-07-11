# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="etable"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Implementation of javax.swing.JTable for Emacs."

HOMEPAGE="https://github.com/Fuco1/ETable"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/dash
	app-emacs/interval-list"
RDEPEND="app-emacs/dash
	app-emacs/interval-list"