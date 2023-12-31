# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
WANT_LIBTOOL="none"

inherit autotools flag-o-matic pax-utils ${PN}-utils-r1 toolchain-funcs

MY_P="Python-${PV}"
PATCHSET="${PN}-gentoo-patches-${PV}-r2"

DESCRIPTION="An interpreted, interactive, object-oriented programming language"
HOMEPAGE="https://www.${PN}.org/"
SRC_URI="${HOMEPAGE}ftp/${PN}/${PV}/${MY_P}.tar.xz
	https://dev.gentoo.org/~mgorny/dist/${PN}/${PATCHSET}.tar.xz"
S="${WORKDIR}/${MY_P}"

LICENSE="PSF-2"
SLOT="3.7/3.7m"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~m68k ~mips ppc ppc64 ~riscv s390 sparc x86"
IUSE="bluetooth build examples gdbm hardened ipv6 libressl +ncurses +readline sqlite +ssl test tk wininst +xml pgo"
RESTRICT="!test? ( test )"

# Do not add a dependency on dev-lang/${PN} to this ebuild.
# If you need to apply a patch which requires ${PN} for bootstrapping, please
# run the bootstrap code on your dev box and include the results in the
# patchset. See bug 447752.

RDEPEND="app-arch/bzip2:=
	app-arch/xz-utils:=
	virtual/libffi:=
	sys-apps/util-linux:=
	>=sys-libs/zlib-1.1.3:=
	virtual/libcrypt:=
	virtual/libintl
	gdbm? ( sys-libs/gdbm:=[berkdb] )
	ncurses? ( >=sys-libs/ncurses-5.2:= )
	readline? ( >=sys-libs/readline-4.1:= )
	sqlite? ( >=dev-db/sqlite-3.3.8:3= )
	ssl? (
		!libressl? ( dev-libs/openssl:= )
		libressl? ( dev-libs/libressl:= )
	)
	tk? (
		>=dev-lang/tcl-8.0:=
		>=dev-lang/tk-8.0:=
		dev-tcltk/blt:=
		dev-tcltk/tix
	)
	xml? ( >=dev-libs/expat-2.1:= )
	!!<sys-apps/sandbox-2.6-r1"
# bluetooth requires headers from bluez
DEPEND="${RDEPEND}
	bluetooth? ( net-wireless/bluez )
	test? ( app-arch/xz-utils[extra-filters(+)] )
	virtual/pkgconfig
	!sys-devel/gcc[libffi(-)]"
RDEPEND+=" !build? ( virtual/mime-types )"
PDEPEND=">=app-eselect/eselect-${PN}-20140125-r1"

src_prepare() {
	# Ensure that internal copies of expat, libffi and zlib are not used.
	rm -fr Modules/expat || die
	rm -fr Modules/_ctypes/libffi* || die
	rm -fr Modules/zlib || die

	local PATCHES=(
		"${WORKDIR}/${PATCHSET}"
	)

	default

	sed -i -e "s:@@GENTOO_LIBDIR@@:$(get_libdir):g" \
		setup.py || die "sed failed to replace @@GENTOO_LIBDIR@@"

	eautoreconf
}

src_configure() {
	local disable
	# disable automagic bluetooth headers detection
	use bluetooth || export ac_cv_header_bluetooth_bluetooth_h=no
	use gdbm      || disable+=" gdbm"
	use ncurses   || disable+=" _curses _curses_panel"
	use readline  || disable+=" readline"
	use sqlite    || disable+=" _sqlite3"
	use ssl       || export PYTHON_DISABLE_SSL="1"
	use tk        || disable+=" _tkinter"
	use xml       || disable+=" _elementtree pyexpat" # _elementtree uses pyexpat.
	export PYTHON_DISABLE_MODULES="${disable}"

	if ! use xml; then
		ewarn "You have configured Python without XML support."
		ewarn "This is NOT a recommended configuration as you"
		ewarn "may face problems parsing any XML documents."
	fi

	if [[ -n "${PYTHON_DISABLE_MODULES}" ]]; then
		einfo "Disabled modules: ${PYTHON_DISABLE_MODULES}"
	fi

	if [[ "$(gcc-major-version)" -ge 4 ]]; then
		append-flags -fwrapv
	fi

	filter-flags -malign-double

	# https://bugs.gentoo.org/show_bug.cgi?id=50309
	if is-flagq -O3; then
		is-flagq -fstack-protector-all && replace-flags -O3 -O2
		use hardened && replace-flags -O3 -O2
	fi

	# Export CXX so it ends up in /usr/lib/${PN}3.X/config/Makefile.
	tc-export CXX

	# Set LDFLAGS so we link modules with -l${PN}3.2 correctly.
	# Needed on FreeBSD unless Python 3.2 is already installed.
	# Please query BSD team before removing this!
	append-ldflags "-L."

	# Fix implicit declarations on cross and prefix builds. Bug #674070.
	use ncurses && append-cppflags -I"${ESYSROOT}"/usr/include/ncursesw

	local dbmliborder
	if use gdbm; then
		dbmliborder+="${dbmliborder:+:}gdbm"
	fi

	local myeconfargs=(
		# glibc-2.30 removes it; since we can't cleanly force-rebuild
		# Python on glibc upgrade, remove it proactively to give
		# a chance for users rebuilding ${PN} before glibc
		ac_cv_header_stropts_h=no

		--enable-shared
		$(use_enable ipv6)
		--infodir='${prefix}/share/info'
		--mandir='${prefix}/share/man'
		--with-computed-gotos
		--with-dbmliborder="${dbmliborder}"
		--with-libc=
		--enable-loadable-sqlite-extensions
		--without-ensurepip
		--with-system-expat
		--with-system-ffi
	)

	OPT="" econf "${myeconfargs[@]}"
}

src_compile() {
	# Ensure sed works as expected
	# https://bugs.gentoo.org/594768
	local -x LC_ALL=C

	#The following code borrowed from https://github.com/stefantalpalaru/gentoo-overlay

	# extract the number of parallel jobs in MAKEOPTS
	echo ${MAKEOPTS} | egrep -o '(\-j|\-\-jobs)(=?|[[:space:]]*)[[:digit:]]+' > /dev/null
	if [ $? -eq 0 ]; then
		par_arg="-j$(echo ${MAKEOPTS} | egrep -o '(\-j|\-\-jobs)(=?|[[:space:]]*)[[:digit:]]+' | tail -n1 | egrep -o '[[:digit:]]+')"
	else
		par_arg=""
	fi
	export par_arg

	if use pgo; then
		emake profile-opt PROFILE_TASK="-m test.regrtest ${par_arg} -w -uall,-audio -x test_gdb test_multiprocessing test_subprocess test_tokenize test_signal test_faulthandler test_asyncio test_ctypes test_compileall test_pyexpat test_runpy test_support test_threaded_import test_xmlrpc_net"
	else
		emake CPPFLAGS= CFLAGS= LDFLAGS=
	fi


	# Work around bug 329499. See also bug 413751 and 457194.
	if has_version dev-libs/libffi[pax_kernel]; then
		pax-mark E ${PN}
	else
		pax-mark m ${PN}
	fi
}

src_test() {
	# Tests will not work when cross compiling.
	if tc-is-cross-compiler; then
		elog "Disabling tests due to crosscompiling."
		return
	fi

	# Skip failing tests.
	local skipped_tests="gdb"

	for test in ${skipped_tests}; do
		mv "${S}"/Lib/test/test_${test}.py "${T}"
	done

	# bug 660358
	local -x COLUMNS=80

	local -x PYTHONDONTWRITEBYTECODE=

	emake test EXTRATESTOPTS="-u-network" CPPFLAGS= CFLAGS= LDFLAGS= < /dev/tty
	local result=$?

	for test in ${skipped_tests}; do
		mv "${T}/test_${test}.py" "${S}"/Lib/test
	done

	elog "The following tests have been skipped:"
	for test in ${skipped_tests}; do
		elog "test_${test}.py"
	done

	elog "If you would like to run them, you may:"
	elog "cd '${EPREFIX}/usr/lib/${PN}3.7/test'"
	elog "and run the tests separately."

	if [[ ${result} -ne 0 ]]; then
		die "emake test failed"
	fi
}

src_install() {
	local libdir=${ED}/usr/lib/${PN}3.7

	emake DESTDIR="${D}" altinstall

	# Remove static library
	rm "${ED}"/usr/$(get_libdir)/lib${PN}*.a || die

	sed \
		-e "s/\(CONFIGURE_LDFLAGS=\).*/\1/" \
		-e "s/\(PY_LDFLAGS=\).*/\1/" \
		-i "${libdir}/config-3.7"*/Makefile || die "sed failed"

	# Fix collisions between different slots of Python.
	rm "${ED}/usr/$(get_libdir)/lib${PN}3.so" || die

	# Cheap hack to get version with ABIFLAGS
	local abiver=$(cd "${ED}/usr/include"; echo ${PN}*)
	if [[ ${abiver} != ${PN}3.7 ]]; then
		# Replace python3.X with a symlink to ${PN}3.Xm
		rm "${ED}/usr/bin/${PN}3.7" || die
		dosym "${abiver}" "/usr/bin/${PN}3.7"
		# Create ${PN}3.X-config symlink
		dosym "${abiver}-config" "/usr/bin/${PN}3.7-config"
		# Create ${PN}-3.5m.pc symlink
		dosym "${PN}-3.7.pc" "/usr/$(get_libdir)/pkgconfig/${abiver/3.7/-3.7}.pc"
	fi

	# ${PN} seems to get rebuilt in src_install (bug 569908)
	# Work around it for now.
	if has_version dev-libs/libffi[pax_kernel]; then
		pax-mark E "${ED}/usr/bin/${abiver}"
	else
		pax-mark m "${ED}/usr/bin/${abiver}"
	fi

	use sqlite || rm -r "${libdir}/"{sqlite3,test/test_sqlite*} || die
	use tk || rm -r "${ED}/usr/bin/idle3.7" "${libdir}/"{idlelib,tkinter,test/test_tk*} || die

	use wininst || rm "${libdir}/distutils/command/"wininst-*.exe || die

	dodoc Misc/{ACKS,HISTORY,NEWS}

	if use examples; then
		docinto examples
		find Tools -name __pycache__ -exec rm -fr {} + || die
		dodoc -r Tools
	fi
	insinto /usr/share/gdb/auto-load/usr/$(get_libdir) #443510
	local libname=$(printf 'e:\n\t@echo $(INSTSONAME)\ninclude Makefile\n' | \
		emake --no-print-directory -s -f - 2>/dev/null)
	newins "${S}"/Tools/gdb/lib${PN}.py "${libname}"-gdb.py

	newconfd "${FILESDIR}/pydoc.conf" pydoc-3.7
	newinitd "${FILESDIR}/pydoc.init" pydoc-3.7
	sed \
		-e "s:@PYDOC_PORT_VARIABLE@:PYDOC3_7_PORT:" \
		-e "s:@PYDOC@:pydoc3.7:" \
		-i "${ED}/etc/conf.d/pydoc-3.7" \
		"${ED}/etc/init.d/pydoc-3.7" || die "sed failed"

	local -x EPYTHON=${PN}3.7
	# if not using a cross-compiler, use the fresh binary
	if ! tc-is-cross-compiler; then
		local -x PYTHON=./${PN}
		local -x LD_LIBRARY_PATH=${LD_LIBRARY_PATH+${LD_LIBRARY_PATH}:}${PWD}
	else
		local -x PYTHON=${EPREFIX}/usr/bin/${EPYTHON}
	fi

	echo "EPYTHON='${PN}3.7'" > e${PN}.py || die
	${PN}_domodule e${PN}.py

	# ${PN}-exec wrapping support
	local scriptdir=${D}$(${PN}_get_scriptdir)
	mkdir -p "${scriptdir}" || die
	# ${PN} and ${PN}X
	ln -s "../../../bin/${abiver}" \
		"${scriptdir}/${PN}3" || die
	ln -s "${PN}3" "${scriptdir}/${PN}" || die
	# ${PN}-config and ${PN}X-config
	# note: we need to create a wrapper rather than symlinking it due
	# to some random dirname(argv[0]) magic performed by ${PN}-config
	cat > "${scriptdir}/${PN}3-config" <<-EOF || die
		#!/bin/sh
		exec "${abiver}-config" "\${@}"
	EOF
	chmod +x "${scriptdir}/${PN}3-config" || die
	ln -s "${PN}3-config" \
		"${scriptdir}/${PN}-config" || die
	# 2to3, pydoc, pyvenv
	ln -s "../../../bin/2to3-3.7" \
		"${scriptdir}/2to3" || die
	ln -s "../../../bin/pydoc3.7" \
		"${scriptdir}/pydoc" || die
	ln -s "../../../bin/pyvenv-3.7" \
		"${scriptdir}/pyvenv" || die
	# idle
	if use tk; then
		ln -s "../../../bin/idle3.7" \
			"${scriptdir}/idle" || die
	fi
}

eselect_python_update() {
	if [[ -z "$(eselect ${PN} show)" || \
			! -f "${EROOT}/usr/bin/$(eselect ${PN} show)" ]]; then
		eselect ${PN} update
	fi

	if [[ -z "$(eselect ${PN} show --${PN}${PV%%.*})" || \
			! -f "${EROOT}/usr/bin/$(eselect ${PN} show --${PN}${PV%%.*})" ]]
	then
		eselect ${PN} update --${PN}${PV%%.*}
	fi
}

pkg_postinst() {
	eselect_${PN}_update
}

pkg_postrm() {
	eselect_${PN}_update
}
