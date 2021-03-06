# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm

RPM_REL="0.1"

DESCRIPTION="Boost your productivity and send better email with Mailspring"
HOMEPAGE="http://getmailspring.com/"
SRC_URI="https://github.com/Foundry376/Mailspring/releases/download/${PV}/mailspring-${PV}-${RPM_REL}.x86_64.rpm"

LICENSE="GPL-3 mailsync"
SLOT="0"
KEYWORDS="~amd64"

QA_PREBUILT="*"

RDEPEND="
	dev-libs/libappindicator:3
	dev-libs/openssl-compat:1.0.0
	gnome-extra/zenity
"

S="${WORKDIR}"

src_install() {
	dodir /usr
	cp -R "${S}/usr" "${D}" || die "Install failed!"
}
