# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="projectile-sift"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Run a sift with Projectile"

HOMEPAGE="https://github.com/nlamirault/sift.el"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/sift
	app-emacs/projectile"
RDEPEND="app-emacs/sift
	app-emacs/projectile"