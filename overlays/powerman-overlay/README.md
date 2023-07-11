# My overlay for Gentoo Linux

## Runit

Modified portage packages:

- `sys-process/runit`: removed default files in `/etc/runit/` (they're in
  `power-misc/runit-scripts`)

New packages:

- `runit-service/service-*`: my `./run` files for many runit services
  (3proxy, acpid, pppd+pppoe, agetty, apache, dbus, dcron, dhcpd, djbdns,
  gpm, i2p, mysql, nginx, nut, qmail, samba, socklog, ssh, tftpd, twoftpd,
  …)
- `power-misc/runit-scripts`: my runit boot scripts (replacement for
  sysvinit/baselayout/openrc boot scripts)

## Other

Modified portage packages:

- `mail-mta/netqmail`: add support for user patches
- `net-p2p/rtorrent`: added colors patch

New packages:

- `dev-inferno/inferno`: [a compact operating system for building
  cross-platform distributed
  systems](http://vitanuova.com/inferno/index.html)
- `dev-vcs/vcprompt`: show info about the current working directory for
  various VCS for PS1 (my [fork of original vcprompt, optimized for
  speed](https://github.com/powerman/vcprompt))
- `media-sound/cue2tracks`: split audio CD image files with cue sheet to
  tracks and write tags
- `media-sound/flaccl`: CUDA-enabled FLAC encoder (former FlaCuda)
- `net-analyzer/alertmanager`: manage alerts for Prometheus metrics
- `net-analyzer/process-exporter`: Prometheus exporter that mines /proc to
  report on selected processes
- `net-analyzer/pushgateway`: allow ephemeral and batch jobs to expose
  their metrics to Prometheus
- `net-fs/wdmrc`: WebDAV emulator for Mail.ru Cloud
- `net-ftp/twoftpd`: simple secure efficient FTP server by Bruce Guenter
  (with added patch which block TELNET_IAC support to allow using
  character with code 255 in file names (required to support Cyrillic file
  names in Windows CP1251 encoding)
- `x11-misc/xse`: command Line Interface to XSendEvent()
- `x11-plugins/telegram-purple`: adds support for Telegram to Pidgin and
  Finch

New packages (my software):

- `media-fonts/developer-font`: Cyrillic fonts for X and console
  (UNICODE/ISO10646-1, KOI8-R, MICROSOFT-CP1251)
  [screenshots](http://powerman.name/config/font.html)
- `media-fonts/russify`: very nice Cyrillic console font from unknown
  source (both for text mode and framebuffer@1280 mode), consoletrans
  tables for dos/koi/win encodings, keymaps for dos/koi/win (2 variants -
  one for `AltGr` eng/rus switching and second for `Ctrl+Shift` switching)
- `power-misc/addgpginfo`: script which add GnuPG info into email headers
  while delivering (for use in .qmail)
- `power-misc/deliver`: [control email
  delivery](http://powerman.name/soft/deliver.html) (for use in .qmail)
- `power-misc/greysmtpd`: [soft
  greylisting](http://powerman.name/soft/greysmtpd.html) (for qmail)
- `power-misc/powerbackup`: [simple and flexible incremental
  backup](http://powerman.name/soft/powerbackup.html)
- `power-misc/powerutils`: [a bundle of useful small
  utilities](http://powerman.name/soft/powerutils.html)
- `power-misc/powerwatchdog`: simple watchdogs for server and service
  monitoring
- `power-misc/remote`: [ease to use wrapper tools for ssh and
  scp](http://powerman.name/soft/remote.html)


# Install

Install layman if you doesn't have it yet:

```
# emerge layman
```

Next fetch list of available overlays and add my overlay:

```
# layman -L
# layman -a powerman
```
