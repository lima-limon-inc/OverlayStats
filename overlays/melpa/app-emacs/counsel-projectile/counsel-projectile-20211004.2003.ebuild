# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="counsel-projectile"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Ivy integration for Projectile"

HOMEPAGE="https://github.com/ericdanan/counsel-projectile"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/counsel
	app-emacs/projectile"
RDEPEND="app-emacs/counsel
	app-emacs/projectile"