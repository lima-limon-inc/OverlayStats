# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs flag-o-matic

DESCRIPTION="A UNIX init scheme with service supervision"
HOMEPAGE="http://smarden.org/runit/"
SRC_URI="http://smarden.org/runit/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86"
IUSE="static"

RDEPEND=""

S=${WORKDIR}/admin/${P}/src

src_prepare() {
	default

	# we either build everything or nothing static
	sed -i -e 's:-static: :' Makefile

	# see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=726008
	[[ ${COMPILER} == "diet" ]] &&
		use ppc &&
		filter-flags "-mpowerpc-gpopt"
}

src_configure() {
	use static && append-ldflags -static

	echo "$(tc-getCC) ${CFLAGS}"  > conf-cc
	echo "$(tc-getCC) ${LDFLAGS}" > conf-ld
}

src_install() {
	into /
	dobin $(<../package/commands)
	dodir /sbin
	mv "${ED}"/bin/{runit-init,runit,utmpset} "${ED}"/sbin/ || die "dosbin"
	dosym ../etc/runit/2 /sbin/runsvdir-start

	DOCS=( ../package/{CHANGES,README,THANKS,TODO} )
	HTML_DOCS=( ../doc/*.html )
	einstalldocs
	doman ../man/*.[18]

	dodir /etc/runit

	dodir /etc/sv

	# make sv command work
	cat <<-EOF > "${T}"/env.d
		#/etc/env.d/20runit
		SVDIR="/etc/service/"
	EOF
	insinto /etc/env.d
	newins "${T}"/env.d 20runit
}

pkg_preinst() {
	if has_version 'sys-process/runit' &&
		has_version '<sys-process/runit-2.1.2' &&
		[ -d "${EROOT}"service ]; then
		if [ -e "${EROOT}"etc/sv ]; then
			mv -f "${EROOT}"etc/sv "${EROOT}"etc/sv.bak || die
			ewarn "${EROOT}etc/sv was moved to ${EROOT}etc/sv.bak"
		fi
		mv "${EROOT}"service "${EROOT}"etc/sv || die
		ln -snf etc/sv "${EROOT}"service || die
		cp -a "${EROOT}"etc/runit/runsvdir "${T}" || die
		touch "${T}"/make_var_service || die
	fi

	if has_version '<sys-process/runit-2.1.2'; then
		pre_212=yes
	fi
}

default_config() {
	if [ ! -e "${EROOT}"etc/runit/runsvdir/current ]; then
		mkdir -p "${EROOT}"etc/runit/runsvdir/default || die
		ln -snf default "${EROOT}"etc/runit/runsvdir/current || die
	fi
	ln -snf runit/runsvdir/current "${EROOT}"etc/service || die
}

migrate_from_211() {
	# Create /etc/service and /var/service if requested
	if [ -e "${T}"/make_var_service ]; then
		ln -snf runit/runsvdir/current "${EROOT}"etc/service || die
		ln -snf ../etc/runit/runsvdir/current "${EROOT}"var/service || die
	fi
	if [ -d "${T}"/runsvdir ]; then
		cp -a "${T}"/runsvdir "${EROOT}"etc/runit || die
	fi
	return 0
}

pkg_postinst() {
	if [[ -z $REPLACING_VERSIONS ]]; then
		default_config
	elif [[ -n $pre_212 ]]; then
		migrate_from_211
	fi

	ewarn "To make sure sv works correctly in your currently open"
	ewarn "shells, please run the following command:"
	ewarn
	ewarn "source /etc/profile"
	ewarn

	if [ -L "${EROOT}"var/service ]; then
		ewarn "Once this version of runit is active, please remove the"
		ewarn "compatibility symbolic link at ${EROOT}var/service"
		ewarn "The correct path now is ${EROOT}etc/service"
		ewarn
	fi

	if [ -L "${EROOT}"service ]; then
		ewarn "${EROOT}service has moved to"
		ewarn "${EROOT}etc/sv."
		ewarn "Any symbolic links under ${EROOT}etc/runit/runsvdir"
		ewarn "which point to services through ${EROOT}service should be updated to"
		ewarn "point to them through ${EROOT}etc/sv."
		ewarn "Once that is done, ${EROOT}service should be"
		ewarn "removed."
		ewarn
	fi
}
