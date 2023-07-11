# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="company-tabnine"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="A company-mode backend for TabNine"

HOMEPAGE="https://github.com/TommyX12/company-tabnine/"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/company
	app-emacs/dash
	app-emacs/s"
RDEPEND="app-emacs/company
	app-emacs/dash
	app-emacs/s"