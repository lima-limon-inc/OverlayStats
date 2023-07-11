# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="term-alert"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Notifications when commands complete in term.el."

HOMEPAGE="https://github.com/calliecameron/term-alert"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/term-cmd
	app-emacs/alert
	app-emacs/f"
RDEPEND="app-emacs/term-cmd
	app-emacs/alert
	app-emacs/f"