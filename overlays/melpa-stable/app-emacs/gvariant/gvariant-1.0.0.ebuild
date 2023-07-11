# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://stable.melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="gvariant"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="GVariant (GLib) helpers"

HOMEPAGE="https://github.com/wbolster/emacs-gvariant"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/parsec"
RDEPEND="app-emacs/parsec"