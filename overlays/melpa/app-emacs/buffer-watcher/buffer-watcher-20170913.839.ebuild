# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="buffer-watcher"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Easily run shell scripts per filetype/directory when a buffer is saved"

HOMEPAGE="https://melpa.org/packages/"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/f"
RDEPEND="app-emacs/f"