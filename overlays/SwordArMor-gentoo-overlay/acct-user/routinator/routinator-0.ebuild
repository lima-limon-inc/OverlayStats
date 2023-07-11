# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

KEYWORDS="~amd64 ~x86"

DESCRIPTION="User for routinator RPKI validator"
ACCT_USER_ID=-1
ACCT_USER_GROUPS=( routinator )
ACCT_USER_HOME=/var/lib/${PN}/
ACCT_USER_SHELL=/bin/sh

acct-user_add_deps
