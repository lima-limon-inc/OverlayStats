# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://stable.melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="org-projectile"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Repository todo management for org-mode"

HOMEPAGE="https://github.com/IvanMalison/org-projectile"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/projectile
	app-emacs/dash
	app-emacs/s
	app-emacs/org-category-capture"
RDEPEND="app-emacs/projectile
	app-emacs/dash
	app-emacs/s
	app-emacs/org-category-capture"