# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="nu-mode"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Modern Emacs Prompts Based Keybinding."

HOMEPAGE="https://melpa.org/packages/"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/undo-tree
	app-emacs/ace-window
	app-emacs/lv
	app-emacs/avy
	app-emacs/which-key
	app-emacs/transpose-frame"
RDEPEND="app-emacs/undo-tree
	app-emacs/ace-window
	app-emacs/lv
	app-emacs/avy
	app-emacs/which-key
	app-emacs/transpose-frame"