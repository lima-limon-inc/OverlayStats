# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://stable.melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="helm-slime"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="helm-sources and some utilities for SLIME."

HOMEPAGE="https://github.com/emacs-helm/helm-slime"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/helm
	app-emacs/slime"
RDEPEND="app-emacs/helm
	app-emacs/slime"