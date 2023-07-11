# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="helm-R"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="helm-sources and some utilities for GNU R."

HOMEPAGE="https://github.com/myuhe/helm-R.el"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/helm
	app-emacs/ess"
RDEPEND="app-emacs/helm
	app-emacs/ess"