# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="helm-spotify"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Control Spotify with Helm."

HOMEPAGE="https://github.com/krisajenkins/helm-spotify"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/helm
	app-emacs/multi"
RDEPEND="app-emacs/helm
	app-emacs/multi"