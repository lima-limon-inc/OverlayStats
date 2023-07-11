# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="rails-i18n"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Seach and insert i18n on ruby code"

HOMEPAGE="https://github.com/otavioschwanck/rails-i18n.el"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/yaml
	app-emacs/dash"
RDEPEND="app-emacs/yaml
	app-emacs/dash"