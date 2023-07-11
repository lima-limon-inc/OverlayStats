# Gentoo overlay

This overlay aims to provide some ebuilds that I need and are not in the
official repo or in another overlay.

If some package is broken, you could open an issue here or send me an email or
contact me via IRC.

## Example of repos.conf

```
[SwordArMor]
location = /usr/local/overlay/SwordArMor
sync-type = git
sync-uri = https://git.grifon.fr/alarig/SwordArMor-gentoo-overlay.git
auto-sync = yes
```

## Side note

If you are looking for packages which need maintainers from ::gentoo, you can
get a list from those that are installed with those two line.

```
source /etc/portage/make.conf
grep -r maintainer-needed "${PORTDIR}" | sed -E 's|('"${PORTDIR}"')/(.*)/(.*)/.*|\2/\3|' | grep -P "^$(qlist -I | sed ':a;N;$!ba;s/\n/$|^/g')$"
```
