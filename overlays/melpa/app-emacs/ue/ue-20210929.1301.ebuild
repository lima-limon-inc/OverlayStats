# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="ue"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Minor mode for Unreal Engine projects"

HOMEPAGE="https://gitlab.com/unrealemacs/ue.el"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/projectile"
RDEPEND="app-emacs/projectile"