# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop xdg-utils

# get the major version from PV
MV=${PV:0:1}
MY_PV=${PV#*_p}

DESCRIPTION="Git Client, done Sublime"
HOMEPAGE="https://sublimemerge.com"
SRC_URI="
	amd64? ( https://download.sublimetext.com/sublime_merge_build_${MY_PV}_x64.tar.xz )
"

LICENSE="SublimeMerge-EULA"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="bindist mirror strip"

RDEPEND="
	dev-libs/glib:2
	x11-libs/libX11
"

QA_PREBUILT="*"
S="${WORKDIR}/sublime_merge"

src_install() {
	insinto /opt/${PN}
	doins -r Packages Icon
	doins changelog.txt

	exeinto /opt/${PN}
	doexe crash_reporter git-credential-sublime ssh-askpass-sublime sublime_merge
	dosym ../../opt/${PN}/sublime_merge /usr/bin/smerge

	local size
	for size in 16 32 48 128 256; do
		dosym ../../../../../../opt/${PN}/Icon/${size}x${size}/sublime-merge.png \
			/usr/share/icons/hicolor/${size}x${size}/apps/smerge.png
	done

	make_desktop_entry "smerge" "Sublime Merge" "smerge" \
		"TextEditor;IDE;Development" "StartupNotify=true"
}

pkg_postrm() {
	xdg_icon_cache_update
}

pkg_postinst() {
	xdg_icon_cache_update
}
