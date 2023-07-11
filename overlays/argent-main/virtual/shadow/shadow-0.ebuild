# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Virtual for user account management utilities"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

# >=shadow-4-1 is required because of bug #367633 (user.eclass needs it).
# On Prefix installations we sort of have to hope there is some shadow
# available, on UNIX-like (or emulated) systems this usually is the case.
DEPEND=""
RDEPEND="!prefix? ( || ( >=sys-apps/shadow-4.1 sys-apps/hardened-shadow ) )"
