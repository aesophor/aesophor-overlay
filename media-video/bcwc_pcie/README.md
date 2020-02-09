Due to the new sandbox mechanism introduced in recent versions of Gentoo, 
it is rather difficult to download the firmware of FaceTimeHD via ebuild,
and thus you'll need to download the firmware yourself.

<br>

### 1. Firmware Download and Extraction
```
$ git clone https://github.com/patjak/facetimehd-firmware.git

$ make
Found matching hash from OS X, El Capitan 10.11.5
==> Extracting firmware...
 --> Decompressing the firmware using gzip...
 --> Deleting temporary files...
 --> Extracted firmware version 1.43.0
 
$ sudo make install
Copying firmware into '//lib/firmware/facetimehd'
```

<br>

### 2. Add this repository if you haven't added it before. 
Paste the following lines into `/etc/overlays/aesophor-overlay.xml`
```
<?xml version="1.0" encoding="UTF-8"?>
<layman>
  <overlay contact="aesophor@mailfence.com" name="aesophor" src="git://github.com/aesophor/aesophor-overlay.git" status="unofficial" type="git">
      <link>https://github.com/aesophor/aesophor-overlay.git</link>
    <description>aesophor's personal portage overlay</description>
  </overlay>
</layman>
```

Also add these lines into `/etc/portage/repos.conf/layman.conf`.
```
[aesophor]
priority = 50
location = /var/db/repos/aesophor
layman-type = git
auto-sync = No
```

Finally, add the overlay via layman
```
$ sudo layman -a aesophor
```

<br>

### 3. Merge this package
```
$ sudo emerge -av '=media-video/bcwc_pcie-9999::aesophor'
```

<br>

### 4. Recompile kernel modules after a kernel update
```
$ sudo emerge --ask @module-rebuild
```
