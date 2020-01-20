# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils linux-mod git-r3

DESCRIPTION="TP-Link UE300/UE330 Linux Driver (based on Realtek 8153 chipset)"
HOMEPAGE="https://github.com/aesophor/TP-Link-UE300-UE330-Linux-Driver"
SRC_URI=""

EGIT_REPO_URI="https://github.com/aesophor/TP-Link-UE300-UE330-Linux-Driver"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"

BUILD_TARGETS="all"
MODULE_NAMES="r8152()"
CONFIG_CHECK=""

src_unpack() {
	git-r3_src_unpack
}
