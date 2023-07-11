# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://stable.melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="flycheck-falco-rules"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="On-the-fly syntax checking for falco rules files"

HOMEPAGE="https://github.com/falcosecurity/flycheck-falco-rules"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/flycheck
	app-emacs/let-alist"
RDEPEND="app-emacs/flycheck
	app-emacs/let-alist"