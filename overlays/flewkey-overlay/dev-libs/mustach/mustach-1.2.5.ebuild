# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/jobol/mustach.git"
else
	SRC_URI="https://gitlab.com/jobol/mustach/-/archive/${PV}/${P}.tar.bz2"
	KEYWORDS="~amd64"
fi

DESCRIPTION="C implementation of mustache templating"
HOMEPAGE="https://gitlab.com/jobol/mustach"
LICENSE="ISC"
SLOT="0"
IUSE="tool json-c jansson"
REQUIRED_USE="tool? ( || ( json-c jansson ) )"

DEPEND="
	json-c? ( dev-libs/json-c )
	jansson? ( dev-libs/jansson )
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

SOVER=".1"
SOVEREV=".1.2"

src_compile() {
	emake jsonc=$(usex json-c) cjson=no jansson=$(usex jansson) libs=all
}

src_install() {
	LIBDIR="/usr/$(get_libdir)"
	dodir "${LIBDIR}/pkgconfig"
	for dso in "${S}/"*".so${SOVEREV}"; do
		dolib.so "${dso}"
		dso=${dso##*/}
		dosym "${dso}" "${LIBDIR}/${dso::-2}"
		dosym "${dso}" "${LIBDIR}/${dso::-4}"
	done
	use tool && dobin "${S}/mustach"
	cp "${S}/libmustach"*".pc" "${D}${LIBDIR}/pkgconfig"
	gzip -d "${S}/mustach${SOVER}.gz"
	doman "${S}/mustach${SOVER}"
}
