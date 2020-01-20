# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Firmware for the Apple Facetime HD Camera"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	app-arch/cpio
	app-arch/gzip
	app-arch/xz-utils
	net-misc/curl
	sys-apps/coreutils
"
RDEPEND="${DEPEND}"

S=${WORKDIR}

PKG_URL="https://updates.cdn-apple.com/2019/cert/041-88431-20191011-e7ee7d98-2878-4cd9-bc0a-d98b3a1e24b1/OSXUpd10.11.5.dmg"
PKG_RANGE="204909802-207733123"

CAM_IF_FILE="AppleCameraInterface"
CAM_IF_PKG_PATH="./System/Library/Extensions/AppleCameraInterface.kext/Contents/MacOS/AppleCameraInterface"
CAM_IF_MD5="a079dfe4af9982df426ba208c8646ba3"

FIRMWARE_OFFSET="81920"
FIRMWARE_SIZE="603715"
FIRMWARE_FILE="firmware.bin"
FIRMWARE_DIR="facetimehd"
FIRMWARE_MD5="4e1d11e205e5c55d128efa0029b268fe"

src_prepare() {
	curl -s -L -r ${PKG_RANGE} ${PKG_URL} | xzcat -q |\
			cpio --format odc -i --to-stdout ${CAM_IF_PKG_PATH} > ${CAM_IF_FILE}
}

src_compile() {
	echo "${CAM_IF_MD5} ${CAM_IF_FILE}" | md5sum -c || die "camera interface checksum mismatch"
	dd bs=1 skip=${FIRMWARE_OFFSET} count=${FIRMWARE_SIZE} if=${CAM_IF_FILE} |\
			gunzip > ${FIRMWARE_FILE}
	echo "${FIRMWARE_MD5} ${FIRMWARE_FILE}" | md5sum -c || die "firmware checksum mismatch"
}

src_install() {
	insinto "/lib/firmware/${FIRMWARE_DIR}"
	doins $FIRMWARE_FILE
}
