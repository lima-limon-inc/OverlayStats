# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://stable.melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="helm-sage"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="A helm extension for sage-shell-mode."

HOMEPAGE="https://github.com/stakemori/helm-sage"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/helm
	app-emacs/sage-shell-mode"
RDEPEND="app-emacs/helm
	app-emacs/sage-shell-mode"