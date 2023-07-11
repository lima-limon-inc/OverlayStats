# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="User for games-server/factorio-server"
ACCT_USER_ID=-1
ACCT_USER_GROUPS=( factorio )
ACCT_USER_HOME=/opt/${PN}/
ACCT_USER_SHELL=/bin/sh

acct-user_add_deps
