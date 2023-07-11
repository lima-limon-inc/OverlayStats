# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="ess-smart-underscore"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Ess Smart Underscore"

HOMEPAGE="http://github.com/mlf176f2/ess-smart-underscore.el"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/ess"
RDEPEND="app-emacs/ess"