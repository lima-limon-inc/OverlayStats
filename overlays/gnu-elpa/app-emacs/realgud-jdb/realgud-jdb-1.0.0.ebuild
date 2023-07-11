# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://elpa.gnu.org/packages/"
SOURCE_TYPE="tar"
REALNAME="realgud-jdb"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Realgud front-end to Java's jdb debugger\""

HOMEPAGE="http://github.com/realgud/realgud-jdb"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/realgud
	app-emacs/load-relative"
RDEPEND="app-emacs/realgud
	app-emacs/load-relative"