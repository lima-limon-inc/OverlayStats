# automatically generated by g-sorcery
# please do not edit this file

EAPI=8

REPO_URI="https://melpa.org/packages/"
SOURCE_TYPE="tar"
REALNAME="ob-elixir"
DIGEST_SOURCES="yes"

inherit g-sorcery gs-elpa

DESCRIPTION="org-babel functions for elixir evaluation"

HOMEPAGE="http://github.com/zweifisch/ob-elixir"
SRC_URI="${REPO_URI}${REALNAME}-${PV}.${SUFFIX}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-emacs/org-mode"
RDEPEND="app-emacs/org-mode"