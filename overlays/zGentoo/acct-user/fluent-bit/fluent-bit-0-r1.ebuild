# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="fluent-bit program user"

ACCT_USER_ID=200
ACCT_USER_HOME=/etc/fluent-bit
ACCT_USER_GROUPS=( logger )

acct-user_add_deps
