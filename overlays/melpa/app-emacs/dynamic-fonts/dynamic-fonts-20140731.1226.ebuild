# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="dynamic-fonts"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Set faces based on available fonts"

HOMEPAGE="http://github.com/rolandwalker/dynamic-fonts"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/font-utils
	app-emacs/persistent-soft
	app-emacs/pcache"
RDEPEND="app-emacs/font-utils
	app-emacs/persistent-soft
	app-emacs/pcache"