# LedgerSMB Official Project Gentoo Overlay

Welcome to the LedgerSMB Gentoo Overlay.  We haven't quite got LedgerSMB
fully packaged yet, but we have most of the dependencies (using g-cpan as a
start).  The rest along with the main package will come soon.

Please check back soon regarding design, installation instructions, USE flags
and the like.

## Using the repository

You can install with Layman.  Note this is not yet an official Gentoo overlay
though this is likely to be pursued when we have the main packages complete.

    layman -o https://raw.githubusercontent.com/ledgersmb/lsmb-overlay/master/repository.xml -f -a ledgersmb
