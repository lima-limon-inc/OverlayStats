# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit gradle java-utils-2

DESCRIPTION="Android Dex to Java Decompiler"
HOMEPAGE="https://github.com/skylot/jadx"

if [[ "${PV}" =~ "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/skylot/${PN}"
	EGIT_SUBMODULES=( '*' '-*test*' )
else
	KEYWORDS="~amd64 ~x86"
	SRC_URI="https://github.com/skylot/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="Apache-2.0"
SLOT="0"

RDEPEND="
	>=virtual/jre-1.6:*
"
DEPEND="
	${RDEPEND}
	virtual/gradle
"

src_compile() {
	egradle dist || die 'Failed to build'
}

src_install() {
	cd "${S}/build/${PN}/lib";
	for jar in *.jar; do
		java-pkg_newjar ${jar} ${jar}
	done

	java-pkg_dolauncher ${PN} --main jadx.cli.JadxCLI --java_args "-Xmx512M"
	java-pkg_dolauncher ${PN}-gui --main jadx.gui.JadxGUI --java_args "-Xmx512M"
}
