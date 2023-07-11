# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

KEYWORDS="amd64 arm64 x86"

DESCRIPTION="User for BIRD"
# TCP port 179, but 179 is already used by acct-group/_bgpd
ACCT_USER_ID=180
ACCT_USER_GROUPS=( bird )

acct-user_add_deps
