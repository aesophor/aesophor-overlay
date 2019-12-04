# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="X11 tiling window manager using space partitioning trees"
HOMEPAGE="https://github.com/aesophor/wmderland"
SRC_URI="https://codeload.github.com/aesophor/wmderland/tar.gz/1.0.2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

src_install() {
	./build.sh -i
}
