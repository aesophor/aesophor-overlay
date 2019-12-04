# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="X11 tiling window manager using space partitioning trees"
HOMEPAGE="https://github.com/aesophor/wmderland"
SRC_URI="https://raw.githubusercontent.com/aesophor/aesophor-overlay/master/x11-wm/wmderland/tarballs/wmderland-1.0.2.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug"

DEPEND="
	x11-libs/libX11
	debug? ( dev-cpp/glog )
"

RDEPEND="${DEPEND}"

src_compile() {
	./build.sh
}

src_install() {
    dobin build/Wmderland
    dobin ipc-client/build/Wmderlandc
}
