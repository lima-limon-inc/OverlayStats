# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="Monitorix system tool user"
ACCT_USER_ID=401
ACCT_USER_HOME=/var/lib/monitorix
ACCT_USER_GROUPS=( monitorix )

acct-user_add_deps
