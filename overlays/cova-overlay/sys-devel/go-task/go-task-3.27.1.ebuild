# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module bash-completion-r1

DESCRIPTION="Task is a task runner/build tool that aims to be simpler and easier to use than, for example, GNU Make"
HOMEPAGE="https://taskfile.dev/"

SRC_URI="https://github.com/go-task/task/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://github.com/cova-fe/taskfile-deps/releases/download/v${PV}/taskfile-v${PV}-deps.tar.xz"
KEYWORDS="~amd64"

IUSE="bash-completion fish-completion zsh-completion"

LICENSE="MIT"
SLOT="0"
BDEPEND="dev-go/gox"

#RESTRICT="test"

DOCS=( LICENSE {README,CHANGELOG}.md )
HTML_DOCS=( docs )

MY_PN="task"
S="${WORKDIR}/${MY_PN}-${PV}"

src_compile() {
	export CGO_ENABLED=0
	cd cmd/task || die
	gox \
		-os=$(go env GOOS) \
		-arch=$(go env GOARCH) \
		-output task \
		-ldflags "-X main.version=${PV}-gentoo -X github.com/go-task/task/v3/internal/version.version=${PV}-gentoo" \
		-verbose \
		. || die
}

src_install() {
	dobin cmd/task/task
	rm -f docs/.nojekyll
	rm -f docs/CNAME
	rm -f docs/favicon.ico
	einstalldocs
	use bash-completion && newbashcomp completion/bash/${MY_PN}.bash ${MY_PN}
	use fish-completion && ( insinto /usr/share/fish/vendor_completions.d && doins completion/fish/${MY_PN}.fish )
	use zsh-completion && ( insinto  /usr/share/zsh/site-functions && doins completion/zsh/_${MY_PN} )
}
