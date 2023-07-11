wichtounet-overlay
==================

This portage overlay contains several ebuilds: 

* app-misc/budgetwarrior : A command line personal accounting manager
* app-misc/tmsu: A tagging manager
* app-misc/tagsistant: A tagging filesystem
* app-misc/vit: A frontend for taskwarrior
* dev-go/fuse: A library to use FUSE in Go
* dev-go/sqlite3: A library to use Sqlite in Go
* dev-util/gws: A Git workspace manager
* media-libs/opencv: OpenCV ebuild with support for libc++ and static-libs USE flag

Usage
-----

The overlay is available directly into layman. You only have to add it to your locally installed overlays::

     layman -a wichtounet

And the packages are directly available. 
