# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="ob-swiftui"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="Org babel functions for SwiftUI evaluation"

HOMEPAGE="https://github.com/xenodium/ob-swiftui"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/swift-mode
	app-emacs/org-mode"
RDEPEND="app-emacs/swift-mode
	app-emacs/org-mode"