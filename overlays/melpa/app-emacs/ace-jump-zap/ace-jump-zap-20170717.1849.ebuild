# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="ace-jump-zap"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Character zapping, \`ace-jump-mode\` style"

HOMEPAGE="https://github.com/waymondo/ace-jump-zap"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/ace-jump-mode
	app-emacs/dash"
RDEPEND="app-emacs/ace-jump-mode
	app-emacs/dash"