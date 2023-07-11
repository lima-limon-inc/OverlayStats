# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
XORG_MULTILIB=yes
inherit xorg-2 toolchain-funcs versionator

EGIT_REPO_URI="git://anongit.freedesktop.org/git/pixman"
DESCRIPTION="Low-level pixel manipulation routines"

KEYWORDS="amd64 x86"
IUSE="altivec iwmmxt loongson2f cpu_flags_x86_mmxext neon cpu_flags_x86_sse2 cpu_flags_x86_ssse3"
RDEPEND="abi_x86_32? (
	!<=app-emulation/emul-linux-x86-gtklibs-20131008
	!app-emulation/emul-linux-x86-gtklibs[-abi_x86_32(-)]
	)"

src_configure() {
	XORG_CONFIGURE_OPTIONS=(
		$(use_enable cpu_flags_x86_mmxext mmx)
		$(use_enable cpu_flags_x86_sse2 sse2)
		$(use_enable cpu_flags_x86_ssse3 ssse3)
		$(use_enable altivec vmx)
		$(use_enable neon arm-neon)
		$(use_enable iwmmxt arm-iwmmxt)
		$(use_enable loongson2f loongson-mmi)
		--disable-gtk
		--disable-libpng
	)
	xorg-2_src_configure
}