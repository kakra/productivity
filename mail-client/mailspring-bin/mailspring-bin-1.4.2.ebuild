# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm

RPM_REL="0.1"

DESCRIPTION="Boost your productivity and send better email with Mailspring"
HOMEPAGE="http://getmailspring.com/"
SRC_URI="https://github.com/Foundry376/Mailspring/releases/download/1.4.2/mailspring-${PV}-${RPM_REL}.x86_64.rpm"

LICENSE="GPL-3 mailsync"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-libs/libappindicator:3
"

S="${WORKDIR}"

src_install() {
	dodir /usr
	cp -R "${S}/usr" "${D}" || die "Install failed!"
}
