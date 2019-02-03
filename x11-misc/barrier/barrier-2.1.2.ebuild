# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Open-source KVM software forked from Synergy"
HOMEPAGE="https://github.com/debauchee/barrier"
SRC_URI="https://github.com/debauchee/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+gui"

DEPEND="
	net-misc/curl
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXi
	x11-libs/libXinerama
	x11-libs/libXrandr
	x11-libs/libXtst
	x11-base/xorg-proto
	net-dns/avahi[mdnsresponder-compat]
	net-misc/curl
	x11-libs/libXtst
	gui? (
		dev-qt/qtdeclarative:5
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
	)
	|| (
		dev-libs/openssl:*
		dev-libs/libressl
	)
"
RDEPEND="
	!x11-misc/synergy
	${DEPEND}
"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DBARRIER_VERSION_STAGE="gentoo"
		-DBARRIER_REVISION="00000000"
		-DBARRIER_BUILD_GUI="$(usex gui)"
	)
	cmake-utils_src_configure
}
