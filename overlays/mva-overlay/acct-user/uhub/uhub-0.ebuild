# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

ACCT_USER_ID="966"
ACCT_USER_GROUPS=( "uhub" )
ACCT_USER_HOME="/var/lib/run/uhub"

acct-user_add_deps
