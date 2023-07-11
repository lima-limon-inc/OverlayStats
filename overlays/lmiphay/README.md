#### lmiphay gentoo overlay

This overlay can be used to install these applications:

+ [app-portage/oam](https://github.com/lmiphay/oam) Automatation to help keeping gentoo servers up-to-date

The overlay also contains ebuilds I have either created or updated from various sources.

#### Browsing the Overlay

See [http://gentoo-overlays.zugaina.org/lmiphay/](http://gentoo-overlays.zugaina.org/lmiphay/) for an overview of the available ebuilds.

Browse the overlay here: [http://gpo.zugaina.org/Overlays/lmiphay/](http://gpo.zugaina.org/Overlays/lmiphay/)

#### Adding the Overlay

This overlay is in layman, you can add this overlay by:

```
layman -L && layman -a lmiphay
```

A copy of the overlay with metadata is available here: [https://github.com/gentoo-mirror/lmiphay](https://github.com/gentoo-mirror/lmiphay)

##### References

+ [QA Report](https://qa-reports.gentoo.org/output/repos/lmiphay.html)
+ [Gentoo Repo QA Check](http://gentoo.github.io/repo-qa-check-results/lmiphay.html)
+ [Ebuild Upstream Scanner](http://euscan.gentooexperimental.org/maintainers/lmiphay@gmail.com/)
+ [Levelnine checks](https://gentoo.levelnine.at/full-sort-by-maintainer/lmiphay_at_gmail.com.txt)

##### Alternative Overlay Setup

The overlay can be also added by either:

```
layman -f -a lmiphay -o 'https://gitweb.gentoo.org/user/lmiphay.git/plain/gentoo-overlay.xml'
```

Or:

```
layman -f -a lmiphay -o 'https://raw.githubusercontent.com/lmiphay/gentoo.overlay/master/overlay.xml'
```

These steps were required prior to the overlay being in layman.

##### gentoo proxy-maintained packages

+ pasystray [![Gentoo pasystray](https://repology.org/badge/version-for-repo/gentoo/pasystray.svg)](https://repology.org/metapackage/pasystray)
+ pdumpfs [![Gentoo pdumpfs](https://repology.org/badge/version-for-repo/gentoo/pdumpfs.svg)](https://repology.org/metapackage/pdumpfs)
+ syslog-summary [![Gentoo syslog-summary](https://repology.org/badge/version-for-repo/gentoo/syslog-summary.svg)](https://repology.org/metapackage/syslog-summary)
+ dstat [![Gentoo dstat](https://repology.org/badge/version-for-repo/gentoo/dstat.svg)](https://repology.org/metapackage/dstat)
