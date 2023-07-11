# myrvolay
myrvogna's personal Gentoo overlay. Do not try to make sense of the name – it does not work, indeed.

Initially made for own convenience, though I figured out it could perhaps be convenient for other people as well. A bit of inexperience might still reveal there and there, but I have gotten over the older packages and improved them to what I believe to be much higher standards. Every single ebuild in here should be at least decent enough for use by whoever so inclined.

My overlay is registered on the list of repositories at https://repos.gentoo.org/, so you can enable it with `eselect repository enable myrvolay`. I suggest masking the overlay's content by default by adding `*/*::myrvolay` in package.mask, and selectively unmasking the packages you want in package.unmask (ex: `dev-python/yams::myrvolay`) – not because I lack trust in my own work, but because this is good practice.

Please feel free to contact me if there is an issue with anything – no matter how trivial! – or if you have an improvement to suggest – I will be glad~

**Update**: I have started contributing to [GURU](https://wiki.gentoo.org/wiki/Project:GURU) directly, and moved a few packages (brightnessctl, dragon, ncpamixer, swaykbdd, yams, wev) from here to here. I will keep this overlay for the other packages I would rather maintain separately, at least for a while until I am content enough with them. 

### Todo list ###
- Try to test everything on arm64 and add to keywords if results are successful

### Overlay content ###
* app-emulation
  * [vkd3d-proton](https://github.com/HansKristian-Work/vkd3d-proton): Proton's Direct3D 12 implementation, forked from VKD3D
* app-laptop
  * [dell-bios-fan-control](https://github.com/TomFreudenberg/dell-bios-fan-control): Simple tool to enable or disable the SMBIOS fan (auto) fan control for certain Dell laptops
* dev-python
  * [decompyle3](https://github.com/rocky/python-decompile3): Native Python cross-version decompiler and fragment decompiler
  * [deemix](https://git.freezer.life/RemixDev/deemix-py): Deezer downloader library and CLI
  * *[deezer-py](https://gitlab.com/RemixDev/deezer-py)*: Wrapper for all Deezer's API
  * *[pycryptodomex](https://github.com/Legrandin/pycryptodome)*: Self-contained cryptographic library for Python (under the Crypto package)
  * *[spark](https://github.com/rocky/python-spark)*: An Earley-Algorithm context-free grammar parser toolkit
  * *[spotipy](https://github.com/plamere/spotipy)*: Lightweight Python library for the Spotify Web API
  * *[texture2ddecoder](https://github.com/K0lb3/texture2ddecoder)*: A Python wrapper for Perfare's Texture2DDecoder 
  * [unitypy](https://github.com/K0lb3/UnityPy): A Unity asset extractor for Python based on AssetStudio.
  * *[xdis](https://github.com/rocky/python-xdis)*: Python cross-version bytecode library and disassembler 
* games-server
  * [fabric-server](https://fabricmc.net): Minecraft server with the next-generation Fabric mod loader
* games-util
  * [gamescope](https://github.com/Plagman/gamescope): Micro-compositor formerly known as steamcompmgr
  * [sidewinderd](https://github.com/tolga9009/sidewinderd): Linux support for Microsoft SideWinder X4 / X6 and Logitech G103 / G105 / G710+
* gui-apps
  * [slurp](https://github.com/emersion/slurp): Select a region in a Wayland compositor and print it to the standard output. *Version bump from ::gentoo* 
* media-fonts
  * [material-design-icons](https://github.com/google/material-design-icons/): Google's Material Design icons
  * [renogare](https://www.creativefabrica.com/product/renogare/): A modern geometric sans serif typeface (notably used in Celeste)
* media-gfx
  * [jp2a](https://github.com/Talinx/jp2a): JPEG image to ASCII art converter. *Version bump from ::gentoo, with upstream source change*
* sys-apps
  * [fr-afnor](https://github.com/myrvogna/fr-afnor): My implementation of the new French AZERTY layout (AFNOR NF Z71-300) for the Linux console keymap
* sys-firmware
  * [brcm43456-firmware](https://github.com/RPi-Distro/firmware-nonfree): Firmware for the BCM3456 WiFi/BT chip of the Raspberry Pi 400
* sys-fs
  * [vramfs](https://github.com/Overv/vramfs): VRAM-based filesystem for Linux
* www-servers
  * [miniserve](https://github.com/svenstaro/miniserve): Small, self-contained cross-platform CLI tool that allows you to just grab the binary and serve some file(s) via HTTP
