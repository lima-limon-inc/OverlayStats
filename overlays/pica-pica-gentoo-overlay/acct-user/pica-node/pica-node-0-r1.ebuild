# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="User for net-im/pica-pica"

ACCT_USER_ID=-1
ACCT_USER_GROUPS=( pica-node )

acct-user_add_deps
