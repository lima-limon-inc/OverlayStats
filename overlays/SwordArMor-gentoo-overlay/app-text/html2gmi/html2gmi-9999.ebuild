# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN="github.com/LukeEmmet/${PN}@master"

inherit go-module git-r3

DESCRIPTION="Command line application to convert HTML to GMI"
HOMEPAGE="https://github.com/LukeEmmet/html2gmi"

EGO_SUM=(
	"github.com/LukeEmmet/html2gemini v0.0.0-20201115160957-70fb785e5e75"
	"github.com/LukeEmmet/html2gemini v0.0.0-20201115160957-70fb785e5e75/go.mod"
	"github.com/LukeEmmet/html2gemini v0.0.0-20201115162526-e63bbe688236"
	"github.com/LukeEmmet/html2gemini v0.0.0-20201115162526-e63bbe688236/go.mod"
	"github.com/mattn/go-runewidth v0.0.7"
	"github.com/mattn/go-runewidth v0.0.7/go.mod"
	"github.com/olekukonko/tablewriter v0.0.4"
	"github.com/olekukonko/tablewriter v0.0.4/go.mod"
	"github.com/spf13/pflag v1.0.5"
	"github.com/spf13/pflag v1.0.5/go.mod"
	"github.com/ssor/bom v0.0.0-20170718123548-6386211fdfcf"
	"github.com/ssor/bom v0.0.0-20170718123548-6386211fdfcf/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20200822124328-c89045814202"
	"golang.org/x/net v0.0.0-20200822124328-c89045814202/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20200323222414-85ca7c5b95cd/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
)
go-module_set_globals
SRC_URI="${EGO_SUM_SRC_URI}"
EGIT_REPO_URI="https://github.com/LukeEmmet/html2gmi.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	git-r3_fetch
	git-r3_checkout
	go-module_src_unpack
}

src_compile() {
	go build -o ${PN} . || die
}

src_install() {
	dobin html2gmi
	einstalldocs
}
