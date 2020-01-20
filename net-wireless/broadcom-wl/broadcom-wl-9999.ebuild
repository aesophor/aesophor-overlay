# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils linux-mod git-r3

DESCRIPTION="Broadcom Linux hybrid wireless driver (64-bit) for Linux 4.7 and later"
HOMEPAGE="https://github.com/antoineco/broadcom-wl/tree/patch-linux4.7"
SRC_URI=""

EGIT_REPO_URI="https://github.com/patjak/bcwc_pcie"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"

BUILD_TARGETS="all"
MODULE_NAMES="wl()"
CONFIG_CHECK="CONFIG_IPW2100"

src_unpack() {
	kernel_is -ge 4 7 && {
		EGIT_BRANCH="patch-linux4.7"
	}
	git-r3_src_unpack
}
